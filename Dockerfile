# 1. 기반 이미지 설정
FROM redmine:6.0.8

# 2. 패키지 설치 (빌드 도구 및 라이브러리)
# - build-essential: 컴파일러(gcc 등) 포함
# - libpq-dev 등: 각종 DB 및 XML 파싱용 라이브러리
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    libxml2-dev \
    libxslt-dev \
    libyaml-dev \
    && rm -rf /var/lib/apt/lists/*

# 3. Bundler 설정 박제 (xapian 제외)
ENV BUNDLE_WITHOUT="xapian"

# (필요 시) 추가로 실행할 명령어 (예: bundle install)
RUN bundle install
