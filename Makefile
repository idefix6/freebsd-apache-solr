# Created by: Gea-Suan Lin <gslin@gslin.org>
# $FreeBSD: head/textproc/apache-solr/Makefile 421024 2016-08-28 15:53:49Z pawel $

PORTNAME=	apache-solr
PORTVERSION=	6.2.0
CATEGORIES=	textproc java
MASTER_SITES=	APACHE/lucene/solr/${PORTVERSION}
DISTNAME=	solr-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	High performance search server built using Lucene Java

LICENSE=	APACHE20

CONFLICTS_INSTALL=	apache-solr3-* apache-solr-4* apache-solr-5*

RUN_DEPENDS=	bash:shells/bash \
		lsof:sysutils/lsof

USES=		cpe tar:tgz
USE_JAVA=	yes
JAVA_VERSION=	1.8+
JAVA_RUN=	yes
NO_BUILD=	yes
NO_ARCH=	yes
PLIST_SUB+=	PORTVERSION="${PORTVERSION}"
USE_RC_SUBR=	solr

CPE_PRODUCT=	solr
CPE_VENDOR=	apache

do-install:
	cd ${WRKSRC} && ${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/${CPE_PRODUCT}
	${INSTALL_SCRIPT} ${WRKSRC}/bin/solr ${STAGEDIR}${PREFIX}/${CPE_PRODUCT}/bin

.include <bsd.port.mk>
