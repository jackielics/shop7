
def get_auth_url():
    weibo_auth_url="https://api.weibo.com/oauth2/authorize"
    redirect_url="http://127.0.0.1:7000/complete/weibo/"
    auth_url=weibo_auth_url+"?client_id={client_id}&redirect_uri={re_url}".format(client_id=2681036351,re_url=redirect_url)


    print(auth_url)

def get_access_token(code="ad60b3ce232e448d602e238f9ba60916"):
    access_token_url="https://api.weibo.com/oauth2/access_token"
    import requests
    re_dict = requests.post(access_token_url,data={
        "client_id":2681036351,
        "client_secret":"1782eedd819f90e9455c1c97feec6e17",
        "grant_type":"authorization_code",
        "code":code,
        "redirect_uri":"http://42.192.117.114/complete/weibo/"
    })
    pass

def get_user_info(access_token="",uid=""):
    user_url="https://api.weibo.com/2/users/show.json?access_token={token}&uid={uid}".format(token=access_token,uid=uid)
    print(user_url)

if __name__=="__main__":
    #拿到用户去登录的url
    get_auth_url()
    #用户登录后会得到一个code，通过这个code可以拿到用户的token
    # get_access_token(code="f0fd13dd4c260095ee49f6561455d80a")
    #网站再拿着这个token可以获取用户的一切信息
    # get_user_info(access_token = "2.00VZhewGNSDPsBa2b8ede74aiVRNHB",uid="6363525093")
