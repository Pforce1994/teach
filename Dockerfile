# ใช้ image Python Python 3.13.1 เป็นพื้นฐาน
FROM python:3.13.1


WORKDIR /app

COPY  ./requirements.txt /app
RUN  pip3 install -r requirements.txt


# อัปเดตและติดตั้ง Homebrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"\
    eval "$(/opt/homebrew/bin/brew shellenv)"\
    $(/opt/homebrew/bin/brew shellenv)

# ติดตั้ง Chrome และ ChromeDriver (ปรับตามเวอร์ชันที่ต้องการ)
RUN brew install --cask google-chrome && \
    brew install chromedriver

COPY  . .

CMD ["robot", "-d", "log",  "testcase"]