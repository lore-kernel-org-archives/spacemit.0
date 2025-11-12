Received: from crocodile.ash.relay.mailchannels.net (crocodile.ash.relay.mailchannels.net [23.83.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112D92594BD
	for <spacemit@lists.linux.dev>; Wed, 12 Nov 2025 04:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762922695; cv=pass; b=laST4iPccfdjzb5gJhiTv8xJYvLyMxtnSAUHHF9NJyUoS4hrA14PFgpMm8AyCQRt9oNlUOBSYP96oVX7RFtnP706PtFhwnMK5+hVHAl7KgTJr5kZ/YbUwxLq0y1g3nsij2lIJg5knfMh9oFLkD8vn7q/9+sobVwCH4isuO4kPsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762922695; c=relaxed/simple;
	bh=9KivrGD3xoNjlKvn9kQQv8aN6LgAM+Fdc98kuKzNt/E=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date; b=SDScNCVQx4ZjCQB1wSEMOzDXA+hWgJpKPSTGhbNbCZZlMdBhhfG1k/Ekgt2N8onVbgBElzW6d4IIB/cIgjFoTYW3JPgEBf1MNGKLM7B3jazIaw5Hbag4tUO6b9PWTXlS60UhEb8vLbAKg7o4wwQaeXvwidjvdfEu2EBgLnJqxUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=c3CQRNje; arc=pass smtp.client-ip=23.83.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="c3CQRNje"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C3350120CA6;
	Wed, 12 Nov 2025 04:44:45 +0000 (UTC)
Received: from de-fra-smtpout9.hostinger.io (trex-green-9.trex.outbound.svc.cluster.local [100.121.213.86])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 2ED39120665;
	Wed, 12 Nov 2025 04:44:43 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1762922685; a=rsa-sha256;
	cv=none;
	b=v3LTPQJzxr1Xh3nPjFIb1iARsvBMt0VdFu1nglefMvcTdoaj1dwTb+Hfjo8aRCr+LK0nIi
	LEOxqzGhsLeU4qBvtBcDNzUEl3AZMTlCkSyq3v1woWfdUTFSqbqiXjrhkJ2fhwb7YIOl5m
	ch+ZrXUv9BW117bmG8eh+TJ4LQFAwywf7VP9QmIIFoE6BjPwpYYEm4H2HPTPKPbnJPNRyt
	6wPgrwpsaDNqmCUPKl54mFfLPBYBurPl7bfsxXWHCZ6EpiFeS197YjLA0Tm5gus8AQsVtT
	UQvJca0WIE9q5qjbebzjJiavhcGJFl+mkC6RjigmLvnUXR4tCrSGEtKo5iwwLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1762922685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=gWvTqx7+tTYvzQaik51mPtFs1qznC/s+mRlEV2OX5Ak=;
	b=Xnrki8bKZNWsIvyAkXaggpCJrCV0sUl9AUsXBKCiPnDzd3xzd9d+xsjJ5L6oRZcK5v0S4S
	M57ujtFS/H4CKFB5Y7WpwsZdJxZ/ZElLUfsnUcwGwblyN1hNicbZTfJX4v666I2JWYStPG
	1l0NeemhnOaSGQsb4MvlBgHvK2Yvq1/cCHDhYa9C4Ohm7lHH+X/cgTqlaGJClF/24SOlez
	jEizgwC2Ntwm/T8O3B665F6Lc2kWC6oVjmHkY0e40BdEQbO6geQ8euYP7Ii18QCMio9UMK
	ZAv3IT6+iGkmwPIOUDKmn7TWZY6h3EcI5rGe4M2PVOHxIHlhb065OzIsqWDKYQ==
ARC-Authentication-Results: i=1;
	rspamd-768b565cdb-bj6n2;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Shoe-Bitter: 7f330a8001916908_1762922685683_1118103663
X-MC-Loop-Signature: 1762922685683:3359293449
X-MC-Ingress-Time: 1762922685683
Received: from de-fra-smtpout9.hostinger.io (de-fra-smtpout9.hostinger.io
 [148.222.55.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.121.213.86 (trex/7.1.3);
	Wed, 12 Nov 2025 04:44:45 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:e24a:32fa:a400:91c])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d5rRD5f44z3xHJ;
	Wed, 12 Nov 2025 04:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1762922681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gWvTqx7+tTYvzQaik51mPtFs1qznC/s+mRlEV2OX5Ak=;
	b=c3CQRNjebgeT+IyjT13VU8HAgAZmZrVGQYFTyjy2rac4zaujKJ7qHZ/wg4k1kTWbP62u2l
	KaArpODu6bdJFoAsqPAxKP7EYH4BIhcyvmQjq54zlyLr1DAkQsZL6+sz/gaM8+yA2aIU7k
	cdNtAalj+jTRyp5QIHTAQVTmtyb3tuO1CMAVcBeO+0Rvh2QZGtuZa4Hw3BTfoLiGg3ksvl
	tXS43z7vh5JWvtS2kguGXLOJm5copnEZtL1FElnuurbQz+d8e5m34QbSiC61YLsl1QTO7v
	Ool/L9sFfdZ9XYuIcObiG13P9xXRpHOlZ/NDnrwIFkcn6HGTwsEp83Y5pxSACQ==
From: michael.opdenacker@rootcommit.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: riscv: spacemit: Add OrangePi R2S board
Message-ID: <20251112044426.2351999-2-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112044426.2351999-1-michael.opdenacker@rootcommit.com>
References: <20251112044426.2351999-1-michael.opdenacker@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Wed, 12 Nov 2025 04:44:40 +0000 (UTC)
X-CM-Envelope: MS4xfMVNK2xIzuy4WMC19TFvaS0296fSICCBfbpkkQJhiyBC4HxXM09fTCRgLWRZ4QTsj3XioJFaA4XlIMzUb+QomrVTIQkWdqJzF6ksO5gG+1H3vPDL7PlD OxcotLIen1pW+/bmqhXZluSMnRQDcWj67BdaxFqe/kS4TXWpIkTZiaxoesoEsi3ZaOGxpkJTvArjiv8vco+gJhpMORx7f2KS3TFcFQoNGAZhFf2t7DgtnDeX 05ptyWUPXjLuja6hzLffAZ/GL30TW1gjEIH8avsN7croIilxKDjyank3R7fQqwnM1aqQYjLflxxJ/6kCs3VQBUOLvI5w+BQaGCcmsNyiTvCvCLl34kAkcJlS NrjtFH5FjmauD9H2ChvYbDd+Pp/MorBU3tZh7t7KG1/NGemi9cxpKw925ACfhmI+wzwwopHty9cc/NpnNk/yYmJvOOXRMUzPbcMQHaTaO2kTdTdOk2AjnnWH LNvkDnCYYA0Y/zg3wnq8Qnh8aSU1AZeM2RB68ziRh2i76r1lxhneA0vbUvejqL1fdKlusV9ENz2cNORaypoZ5YseqF+MzV+rtLT9/v/32HoVtSMqJwycMjlQ d/ngjjsW0+PKBR7Aqk1gS8DpsGQKjwMyIfk8LTVVaQd/x/4onyuY2M7J6JEegUJSlLVt36zPy43JSyRyvInbtO5vfmDuSfmLXnUO00CGFamJ+z66zHcbjRnn PJU0sBivWIA=
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=691410b9 a=XVsSf4j1YTBLvHmD+RU1sw==:617 a=xqWC_Br6kY4A:10 a=5dAzR5NRAAAA:8 a=lv0vYI88AAAA:8 a=d70CFdQeAAAA:8 a=GJGCkeFiLITI3ydwnRgA:9 a=9STjDIb-X-UA:10 a=ZKAZAlVgJm32z6MX8p4a:22 a=9qqun4PRrEabIEPCFt1_:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Document the compatible string for the OrangePi R2S board [1], which
is marketed as using the Ky X1 SoC but is in fact identical in die
and package to the SpacemiT K1 SoC [2].

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 52fe39296031..9c49482002f7 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -23,6 +23,7 @@ properties:
               - bananapi,bpi-f3
               - milkv,jupiter
               - spacemit,musepi-pro
+              - xunlong,orangepi-r2s
               - xunlong,orangepi-rv2
           - const: spacemit,k1
 
