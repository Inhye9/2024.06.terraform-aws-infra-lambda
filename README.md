## 생성형 AI를 통한 위험감지 및 운영자동화, A.I&fra

## 📌 개요

- DB  서버 일일 보고서 작성 및  담당자에게 메일/Teams로 발송
- 이상 쿼리에 대해 쿼리 튜닝 제안서 기능

## 📌 아이디어

- Maxguage 수집 서버(dsl791dev)에서 DB 서버 및 쿼리 내용 수집
- AL 모델(`gpt-3.5-turbo, gpt-4-turbo`, `Llama2`)  사용, Microsoft AutoGen 활용
- if 이상 쿼리 o →
    - AI 모델 활용하여 쿼리를 튜닝
    - AI 모델 활용하여 쿼리를 성능 비교
- AI 모델 활용 보고서로 작성
- 보고서를 담당자에게 메일/Teams로 발송

## 📌  사용 기술/AI 모델

- AWS 인프라 구축 : Terraform (vpc, subnet, nat, igw, ec2, alb, iam, sg, rtb, site-to-site vpn)
    - **~~EC2 인스턴스**: `g4dn.xlarge, g4dn.2xlarge`~~  —> m5.xlarge/lambda
    - **스토리지**: 최소 200 GB의 `gp3` 또는 `io2` EBS 볼륨
    - **네트워크 성능**: 최대 25 Gbps
    - **운영 체제**: Amazon Linux 2 또는 Ubuntu 20.04 LTS
- Maxguage Data 수집
    - EventBridge Scheduler
    - EC2/AWS Lambda
    - SQLite: 로컬 데이터베이스, Maxguage 데이터를 저장 및 관리
- AI Model: [`GPT-3.5 Turbo](https://platform.openai.com/docs/models/gpt-3-5-turbo)/gpt-4-turbo/Llama2` → gpt-4-turbo/o
- AOP: Agent Oriented : Microsoft AutoGen
- Python
