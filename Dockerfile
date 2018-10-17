FROM centos:centos7
MAINTAINER Instana  Project <hugh.brien@instana.com>

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install nodejs npm; yum clean all
RUN yum -y install python-pip; yum clean all

RUN yum -y install wget

RUN rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm

RUN yum update

RUN yum -y install dotnet-sdk-2.1

RUN yum -y install aspnetcore-runtime-2.1 
RUN yum -y install dotnet-runtime-2.1

RUN mkdir -pv /apps

RUN cd /apps

RUN dotnet new mvc --name /apps/demoapplication

RUN cd /apps

RUN yum update

RUN yum -y install nuget

RUN ls /apps

RUN ls /apps/demoapplication

RUN dotnet add /apps package Instana.ManagedTracing.Sdk --version 1.0.4	

RUN dotnet add /apps package Instana.Profiler.Linux.Bundled.Refs --version 1.0.34.3	


EXPOSE 5000

CMD ["dotnet", "run", "-p", "/apps" ]




