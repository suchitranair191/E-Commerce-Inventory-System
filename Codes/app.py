from flask import Flask, request, render_template, jsonify, json
import psycopg2 
import psycopg2.extras
   
app = Flask(__name__)
   
app.secret_key = "cairocoders-ednalan"
   
DB_HOST = "localhost"
DB_NAME = "vishnu"
DB_USER = "postgres"
DB_PASS = "1234"
   
conn = psycopg2.connect(dbname=DB_NAME, user=DB_USER, password=DB_PASS, host=DB_HOST)
   
@app.route('/')
def home():
    return render_template('index.html')
  
@app.route("/ajaxfile",methods=["POST","GET"])
def ajaxfile():
    try:
        cursor = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        if request.method == 'POST':
            draw = request.form['draw'] 
            row = int(request.form['start'])
            rowperpage = int(request.form['length'])
            searchValue = request.form["search[value]"]
            
            print(row)
            print(rowperpage)
            print('search_value',searchValue)
            
  
            
            cursor.execute("select count(*) as allcount from customer")
            rsallcount = cursor.fetchone()
            totalRecords = rsallcount['allcount']
            print(totalRecords) 
  
            
 
            likeString = "{}%".format(searchValue)
 
            print(likeString)
            cursor.execute("SELECT count(*) as allcount from customer WHERE customer__id LIKE %s", (likeString,))
            rsallcount = cursor.fetchone()
            totalRecordwithFilter = rsallcount['allcount']
            print(totalRecordwithFilter)
  
           
            if searchValue=='':
                cursor.execute('SELECT * FROM customer LIMIT {limit} OFFSET {offset}'.format(limit=rowperpage, offset=row))
                hv = cursor.fetchall()
            else:      
                cursor.execute("SELECT * FROM customer WHERE customer__id LIKE %s LIMIT %s OFFSET %s;", (likeString, rowperpage, row,))
                hv = cursor.fetchall()
            
            if len(searchValue) and searchValue[-1]==';':
                try:
                    cursor.execute(searchValue)
                    hv=cursor.fetchall()

                except e:
                    print(e)
                finally:
                    cursor.close() 
            
            #print(hv)
            data = []
            if len(hv)==1:
                 data.append({
                        'customer__id': hv[0],
                        'customer_unique_id': None,
                        'customer_zipcode_prefix':None,
                        'customer_city': None,
                        'customer_state': None,
                    })
            else:
                for row in hv:
                    data.append({
                        'customer__id': row['customer__id'],
                        'customer_unique_id': row['customer_unique_id'],
                        'customer_zipcode_prefix': row['customer_zipcode_prefix'],
                        'customer_city': row['customer_city'],
                        'customer_state': row['customer_state'],
                    })
  
            response = {
                'draw': draw,
                'iTotalRecords': totalRecords,
                'iTotalDisplayRecords': totalRecordwithFilter,
                'aaData': data,
            }
            return jsonify(response)
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
  
if __name__ == "__main__":
    app.run(host="localhost", port=8000, debug=True)