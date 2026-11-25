Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570751;
	b=gpoe9qev3fgBSj3kQj3eqZe49ZllNniLng0NUkPDZ4LPJGE2drxePvxmoEzMGgTmcnom
	 TKC85u4YvDbGZu4Hj4NMfV+lKhCrS0J/GT8nujs2HwsyvFRIhhIDuRDwdfQKgJI1VwUZr
	 e+dUapLR8MDH/4QZsxCzusicim2ZLrHRzqOTNhP4qBSvXwPju6UzMWcTAQhxWpusZv+WL
	 7pXPonnT7AipsPrfP7vklAE0fZuWQ8WsA+X2AcXa9ugOCbUtNb8G4XZNt4WGXNxWL6NSf
	 TAHXTE9xZM5OVAjBFpFnatGmAoG+yMRcqhuHe9hhbkWxHPTOmvQ7hv2HMlBTS7WLUyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570751;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=k/qijytVFIsC4oBmo7E3xWvc1VpP3rElv6FAFcCDtSk=;
	b=RbjNqf7YgDl8NAMWCcEnujzOC1XEgZn9KCLV/r0PmLsr9SjZrUDpu32yYHTudw1jREIo
	 UxuOpODsU2D2/Vx5jMJNhevLV7dqc7M3qTnMWX/bH1FjR1vOoMcXJLF4KnR1hb+MH+7ZQ
	 6jjctmGd1T5mDJ7N0QpLppGSjklEEG3Hl8qfZvt9FHfemC7HfeRPbh/bFDmrFAMz+x6yL
	 fMpjWfb0sMpTQXwaGEwzxJ3h4IQ6AXPgfBAqd8n3bshNJCGWT8KjYspbeQ2k2cRTumnYj
	 r8/L9ERxnCKFs3XifrUQZpGb6jrpknw9XHXr8fGWtS2svnGv5saifp8kK4GiQz4bIRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=OF4axXZG;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719ED606A691
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 01:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 719ED606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=OF4axXZG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795570736;
	bh=k/qijytVFIsC4oBmo7E3xWvc1VpP3rElv6FAFcCDtSk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=OF4axXZGTF1qfqvRZiz/JtxjxaW8akUj1PWSe0W4qR2PIDuU2rbZoYsDI+m4AInMP
	 bcTFTAmK/FbqWLiWXmOERBWwY9QSqWq1I4ZP+udyRrRoYueBa42OaAuIOKNIzHPw4H
	 /gg1Fi1bU23tM6P6FaPYv2SkYTByiXO1txKzlPW8=
X-QQ-mid: zesmtpsz4t1795570735t6bbabc43
X-QQ-Originating-IP: 0ipUMo1ro68wul0tWJTxBe0L3A0y0yI1TLXD4IzXO8Q=
Received: from = ( [183.48.244.245])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 09:38:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7546957723103759865
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 25 Nov 2026 01:38:24 +0000
Subject: [PATCH v3 5/5] MAINTAINERS: Add entry for SpacemiT timer
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-spacemit-soc-timer-v3-5-e6390f3ae4a6@linux.spacemit.com>
References: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
In-Reply-To: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=795;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=iHFUNkL4vpfnAkYRawlVPY3gFssiqBgZcrn/XNSsq1c=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDNlsNqKcdftf+Hkl39Oz5yqZMU+0xWz5oZfr7GbsU1Zaz
 Lg90vV8RykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwESiyxj+2cQxt2pMYI4+9ULU
 N0B74vqyw/4aX1+3+k4Ke6r+galtHyPDpEvbG+aysgpvr95u6P9SacdRtxqO2FX+f5+5uZ3XFX/
 KCAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ORqNQdnYjakCneEckYyMZq2geyR0FvsdiXdGpB1Xyzs1Yi2I1tsake7X
	mH6xGfMQydNDKRrHEmqR1qvS+afUCD8AjdwTWNVFRbnHgjE3xmkocHit+Yiws6siVr8MYLH
	c0CLHiQXO9FuLZY+0GUly6VVIfv5Nj0x0ysmRVIHhGfGmzGR1bcENICowW2y4JPlbxwf7ll
	9JSv1idirHd6bJplU/kcJxZja5249hTwzZdr3+GQcbEYEfOT4jf1BdwEbz09gwVcQKq2xwn
	jMN3oD501JPMt6Sv5cZ3nxjSjzkdaAX4t1H6UrkX29CtrIqnEAz3euk7lujopb98TB5c5nY
	/hQJDUSxHhoNwU6EWcHcsuJYaP+oQ0rRTCpTWIPekg0jmyUo8WSDJvfNQ2dqmj0Sw0T4SRv
	w7/Z76mJmgKIKOaUiGhLhxsytB+cfXJ40rHDawKfINV0AQrfBkDgKrYBvLViEHazaC08y+j
	SIHilSBQ7vYQ5TLTXVEFaQGy93WxhlL5h07O/aATb+poU/7rjbicUkVmmqx7LGi0RGw02pc
	eJyijYCN59mCsLoMOwE0ihh0TdbGNTUOtkebpalOPZ+ihwJ0t4jqNM3fwHtGSL7GCx6FRC1
	SXzUpN/Z28FnogUTPHiCEiu4AstUHoJx8m/4wFsZgDgY53wHfLFpfUJxFXu6dDDMdZZC2de
	Njg0HRHy2xcyTpeUClEHhWb60JhF5JCM0L//o5nj3UxhUMZ6KbhdV5IQcMChBgCeWxZODtT
	b9cQrAhSpLMI+utkXh10x1zkR/UivhJv5+Eaiun9mqm3UMRBf7uMfapmrKYVkMl0xPq/NeY
	gvxSjJ3BFxkLFOY7Aok0F0/NcErxCVcn5NkxrlimXeEePyybfZ2IhwFa5hT7xzn1iqGL2PI
	d2bkkheFiw2+F7C11H1RMysxT1M/xIiQZVTB/ckZZ5BvISPlIqjLcu+ANNBB3p2k6p2Ob5v
	wro1T10bbVeHN7d1REtwY4IIghFboD3RIQLGHbROoirDGWERNXQ1f9CmVuVJKb+1SGq/EtU
	P+eRlKichfNWQpkthUosfPsJgg2WCvutA8NrHKS3Byb/PShriKvwUb492a1TbraO2pUQGDu
	XzSC3f0vTfC
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Add a maintainer entry for the SpacemiT K1/K3 timer binding and
clocksource driver.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..e607e9cb07a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26372,6 +26372,12 @@ S:	Maintained
 F:	drivers/reset/spacemit/
 F:	include/dt-bindings/reset/spacemit,k3-resets.h
 
+SPACEMIT TIMER DRIVER
+M:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/timer/spacemit,k1-timer.yaml
+F:	drivers/clocksource/timer-spacemit.c
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

-- 
2.56.0

