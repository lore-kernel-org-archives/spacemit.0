Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D0138DE1
	for <spacemit@lists.linux.dev>; Fri, 26 Sep 2025 14:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758898368; cv=none; b=lm7NaunjEC/io2JTiF21W1yYI6Fm91Jzhdobf5Cf+QajYkIuwBzLmcSXbIWEfgwo8qDigmTfivWl1Fnk6tksJ1HOWD+p+ghOQLWRRia3cCNFcriZkdFJ4ZaqWytAD6ncFsYsFZ+qmHRc6eLQ3XNLiF5phDlXFzRhR5DrMTcsh04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758898368; c=relaxed/simple;
	bh=pabvuS7ERSr0cN0D9B8Q+GSWZmWJ1OeAXzdxxMSV1MU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YF2I6JiDD590Y0qJX60MC5YCilPfZb+eaBBQC0KyTCtTPm6ptf87djCdu5Y7QcthuRiYlpH+MQygV30qR2L1q7LbEF89gAupR5HRDwUBuPeUZYM6RvCNUGzA6hJXkJa43BirVBpHCS6axxpF+iLPqmX/XkeaCWDcziVXHOfehJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=UFGvmXsB; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="UFGvmXsB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758898318;
	bh=vFE1PUzEEezMM4U55l7K1/txiuS3BcROBCCnBs04NoM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=UFGvmXsBXr73Wcdhq/6cw+qG5/aqxSHvgP8AXdoeQcheEBcD9Focbg4+zSGyj45gy
	 jWB1+ScYUIHBA95T9aPS0rCy1MAfRpiOqRFQl+fNdDPGHoFxdM6f8ht7tHhBRMn57x
	 hYzxnpmTWhYRqglQDUnlcMT+e1GPTEfylJ2wSavU=
X-QQ-mid: esmtpsz17t1758898317t2082fb2c
X-QQ-Originating-IP: D/mOMn3lf1ftlbF+tkgWxY1FMJGFnx2TTc3hgjsSf8U=
Received: from = ( [58.254.68.229])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Sep 2025 22:51:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16032009943312848604
EX-QQ-RecipientCnt: 6
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 26 Sep 2025 22:51:52 +0800
Subject: [PATCH] MAINTAINERS: add entry for SpacemiT K1 I2C driver
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-k1-i2c-maintainer-v1-1-3643be945fac@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAIeo1mgC/x2MMQqAMAwAvyKZDdRgq/Ur4lA0ahCrtCJC8e8Wh
 xtuuEsQOQhH6IoEgW+JcvgsVVnAuDq/MMqUHUiRVpYMbhUKjbg78VeGA06sXd202pIzkLsz8Cz
 P/+yH9/0Aa3z/TmMAAAA=
X-Change-ID: 20250926-k1-i2c-maintainer-de5a478592a6
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758898315; l=1152;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=pabvuS7ERSr0cN0D9B8Q+GSWZmWJ1OeAXzdxxMSV1MU=;
 b=NOENju1h6muc01x6FmR+3oqlmnKHg4pnPylLOrYC7+dAYxjaByjDbxLHEeaMDS7BvID36F1tv
 0+vS0+so+/6A9BKMTqqd/DwEuZwsg5CsHPhAEgmcyFdoeGB2QFfZhv7
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N9/m7ncAytaJjfwl+AhFZezNb9HTWjXZQ4TrR30U6+fzf2keufQB2mkt
	kQ22LP0MG/NvoMfZH+/QcYC2wRhoOS1bc5CfsM1oOhiE99QT0mNxEDhJO+qzOrnvzkdPDtZ
	QDYDUvdQD/8lUTYsMdhi4jF8C4GMpKqlQAT0aeXAbwYM88l3OqZ+KdORWxetq4iadfjiU+x
	GQFLx0BF9osgIr3GDq3YpOVarUn2dW2onVy25rWHie9i8StrnQzgtqsu6OFrQtGxdxiubgK
	dfN2ZkZ9iWiR+I/pT4hrw5A+p8FDRoR4cw8fsO+QNRVJR71Klipe6N4PJZZvrG2Xd06VziB
	q6RMwzBkX4iztM+PZ5PsRUeijHiXBXDL23IoJOvpL/GQwo/9V18XdH8YLS6QrR19yILjmNw
	oYEy/3E6YSsnD7kk++sTjwWTyJFlr2mdvBf2n7xqNkRLWAEboWejCBVnwYe3ECctqhq+8mC
	xB/hPZsQilVo4DfdRQPekLSxrPfLabiGiaKx/wwDXBQKmhfLJTj1o1vfMBNIYLvd/QNeXqq
	82b5/9nUQFwNHwwPHDv75LKSuQw/u2uQ4/wNSPqBAurST4uhHYWf2gKHPcZnBYX+GdxgVVu
	h7VdpkiTEYfnRIaCHb+vUh/L3K7J6/zn9l6teh1/E3jnr/EzDiiKAwcicqTeqyEgub0h4Qd
	SqVQA08u8BW2QZR5CvfnGbhy6WSAyuT/IlnCklMz6aHTkH/F6zdijgEK+qXaIPAgNJw5oH3
	SwMbigTnwHkbS05pZJBwzub9Un6a7Wi+wDWRYPRUmDX85afUPvt56DVnRjk6Sw+Gz7raTTT
	/zndOGB5bymoNlaKC6ptcxOfG2B4C+a3YCGjXzrO3+ercJ+K+QLPrQNNg9EQH+PHEnyXPsT
	LZ1wrruT1R3svNtn0BtWtO8wmYR6fBs81NfsAeGSnJJ/16hOc34yiFbooEM7VL/hT4oSN7T
	NiFqlgvJR6L4D1aVQ38rlEGRqDyJRDmWDS74dGWNt/LPXW1HjUYBpGYMd4ssGP/QC+wwnlZ
	FwMiPIZZEg3xmzvB4Q8Ywlc9KlEjLxYIJrDqSLzm2mThRvobsASOW+RW9SNbNeLctmPDkdD
	yrQpP8eVnar
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

Add a MAINTAINERS entry for the SpacemiT K1 I2C driver and its DT binding.
(Suggsted by Wolfram[1])

Link:
https://lore.kernel.org/all/aNW5KfIg-_4-Et1S@shikoro/ [1]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8fcf4e34eaa52c1dc6894823cd83bb6941980e17..2d151233a0e3d0dab2d6ecd278d27a9ff051e3de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24073,6 +24073,13 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/sp2*
 
+SPACEMIT K1 I2C DRIVER
+M:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
+F:	drivers/i2c/busses/i2c-k1.c
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

---
base-commit: c8057e20d7aea985e3b55753fea9ef3562aeed1d
change-id: 20250926-k1-i2c-maintainer-de5a478592a6

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

