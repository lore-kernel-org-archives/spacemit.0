Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9852937DEAA
	for <spacemit@lists.linux.dev>; Mon,  8 Jun 2026 18:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780943055; cv=none; b=VvzpT9+TJyVn9ZStytExDht1tJRzG26tmVgDcnSMt1NRL3tQJw+3fTwj0N6k3I08aXmQEUKAYJp2XKcibtdIDGcyrAA7pMx/mt1FzAvF6JOeRBoyIJ/NXlt6KrxUzgw5sR3PrC5HbEp2WKBhoogFN6PT5+MxWYsDYd7KJ+dNqz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780943055; c=relaxed/simple;
	bh=9dbbT8kRF7/HzlQxQV262HCem7BAh4ObLpo4HdTGxD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BnPEaQ7AoW2LpZggUuexgGsErCkj36yxekZuN71g7M/aivinmK8/4OTQ2PgA3D8se9LiQBhRPOFLtZjlwbrUCF89inBEVgWb4+n+SlluXUCQIFxrdvEcFmNMi02Z8G3rSS3fLFyo8H4Wexj7rHzYBDLCfu2ERr8YtPHj6iXGJS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rembrandt.dev; spf=pass smtp.mailfrom=rembrandt.dev; dkim=pass (2048-bit key) header.d=rembrandt.dev header.i=@rembrandt.dev header.b=O7/JHW+X; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QKFPOgLu; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rembrandt.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rembrandt.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rembrandt.dev header.i=@rembrandt.dev header.b="O7/JHW+X";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QKFPOgLu"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4C6877A00D4;
	Mon,  8 Jun 2026 14:24:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 08 Jun 2026 14:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rembrandt.dev;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1780943050; x=1781029450; bh=JlDRfDpLWU
	JP0KKLhrn8R5zDo5NsEXdo86YUxt5LoQw=; b=O7/JHW+XJWQDWRnGkRurfJHb0V
	vkkbXb0AEi3PUyKQ7FVVHbP2Laeq97/Xhs7H+W7vUAyJ3/CO2Lh+eKAJRS6V/3o0
	m1UAw+l83lGEMdzg1mMnYc/UKwdzDWfc+dADfkjIfsaJng3evuR+vXK1sXsld6AN
	3vhWh7n/7MKoi006qiAJLTzCh24xwgPbidFZR/t8Upl+g9yi8InghNDdgIS57gps
	LB8vuyDu78mNZvK8qsxhbGtxpOXaufhI95dA9BHUIu19N1kFXR0f5BQWR21iq9A0
	0ZtMo7qgBbPwQ4hBWT8egWcCOtwPxbsN5SM16CYTbG0Ttwd0ataw0yyca3RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780943050; x=1781029450; bh=JlDRfDpLWUJP0KKLhrn8R5zDo5NsEXdo86Y
	Uxt5LoQw=; b=QKFPOgLu9K/A8EMolDA8P858MBWTOgc98G/b74bQdWgtUf4/7Lw
	vQZBCDyIs8J4Zs3dUs4FVEiVNUyaxyp1iN8zvOosL6oqtv4FDAsaoXIhM+SRfhXu
	A0tsC5vE/qzWE4E5/TixU+rb/F63udRy7NLESxYQLBGsIIQFZbZotuFxAH4Mk4mY
	Qz6e5tNqwPDMVDfAubgjOJA0DAdpRYSukDjPEGysEb6EFK3rzBw6X9bxqDmpOu1r
	61/Fpjon9Q9trSPcqaNHUOLkvyq11bpIrm7nmAPNN83TbNh9Z9ciOE6hH6W6Fk3w
	25Z9k51QhH207sjkJUfZp9kFMRW5ugaiyVg==
X-ME-Sender: <xms:yQgnaihBs8S1wotLDz1ZE6woVQXZA9fI-AKqNBoNEM0Pstnjz8Byiw>
    <xme:yQgnar8HuZGf3ecNov7JxewM4ulYnxMIsVW4Ba8WkNMOrlFf9k0PfQ0MMvZI7wxwK
    pI3rrdLtY6J4zojnuRjzguNDB6-dsZGua9Jxdn4qLgQFfF_xRAt>
X-ME-Received: <xmr:yQgnalouC2VzFeDRDbdiOv1ocSZpvUz7W6zhuCJQfdS3UdWRBKMueldQ>
X-ME-Proxy-Cause: dmFkZTGCd3RHnqhvv9zPwZw++miCJ850lXAf6ZjSsAgVNqBm72k8vsYjwuAQ3p9xzDqkm9
    rsyY/X49s2IAaf9XPy8X9c49Ibo0/H/Bmy5rEoYXDIVH0Qksj5QtNOiYwSQvORQePkeC1b
    pB2GTeCUYl5cxtcvuQpOBT9b1Y4qxdNnKDmM7hHVZVwll9FXMeOACXax2vL/b2pTDp7gF/
    oPuMEbLLzvd5uT413YzYkH/jAXA6lzBEEeNg7kaxY//x6BavEVKaevLrqGia6O7VI9Rfix
    1/1z/VCZXN3HPzwzO0DTQMv7DVs4lfl5V49eWdIZAqnFZGvLeALltbQ5y0UMvQKnkZD3Bg
    CnNBKRdfcPT1Q1nDDR83RrC3fDWPXCy6nEv/pFXEUEoyNM1NXOgSs5YLxlnbMDKc0UT55k
    BsAo8fggGqoAkxDJLxuLu7rG4tvHpsVqkgADvG+2gFrvWNMKavFMlVdgYtajcYyyfh1njA
    myaB1gIi849BX8c0ftpkCEWLzz0GN5r/s1mJu412fgC7oJhR3Q6447+Vpr3M1RpNhkJ9k2
    8DeEe9BDF+urHFy4RUINedILguwHS2Wog+coxPQwKB7hAX988gI7mZHIQfd9hbDiCp7XIN
    cv+fV2JqjGqaFsEfCW+auT3rDv0ulrlBrCguIbo51X6FF20EGVhrejOjabCg
X-ME-Proxy: <xmx:yQgnarXZ0M9OTbiuxd3FAA3aBF81jomm3n8G_whbNkBKMuEG6GOgNw>
    <xmx:yQgnasCqJBHH0FiDinzZH5TCZt-4gfu3rU8CJAjEKMy70qImDhZdQA>
    <xmx:yQgnan2j8gpGnmS91Ne1ukT4NSug8tlbZqoYsejrLguehWWvBrzMJA>
    <xmx:yQgnam254yuhyAxdxiN2KBwf903K1GoAo4SNT1dIG3XEQ_Raha9XpA>
    <xmx:yggnasxOeIujDslyHXy6HT2bfIGo53BUd_09yxmQ4aV17FR_52KSuMNn>
Feedback-ID: iec564b6b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Jun 2026 14:24:08 -0400 (EDT)
From: Andrew Rembrandt <kernel@rembrandt.dev>
To: Yixun Lan <dlan@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel@rembrandt.dev
Subject: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional ethernet TX timing
Date: Mon,  8 Jun 2026 20:23:58 +0200
Message-ID: <20260608182358.170489-1-kernel@rembrandt.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "rgmii-id" PHY mode applies a symmetric 2ns internal delay in the
PHY. On the Pico-ITX board this leaves insufficient TX timing margin and
no ethernet traffic passes.

Add a 400ps MAC-side TX internal delay on top of the PHY's delay to
correct the TX clock/data skew. The value follows the vendor fork's
asymmetric tuning (tx-phase 73 x 33.3ps - 2000ps ID ~= 400ps); the
driver rounds tx-internal-delay-ps to the nearest supported step.

This builds on commit 3ea695eb111f ("dts: riscv: spacemit: k3: Fix I/O
power settings"), which fixed the GMAC0 1.8V/3.3V I/O switch

Tested on Pico-ITX hardware with iperf3: 60s TCP each direction and 60s
UDP, all at 1Gbps with no TX/RX errors on the interface.

Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
Signed-off-by: Andrew Rembrandt <kernel@rembrandt.dev>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..59aecaa2d32a 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -186,6 +186,7 @@ &eth0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_rgmii_0_cfg>, <&gmac0_phy_0_cfg>;
 	phy-mode = "rgmii-id";
+	tx-internal-delay-ps = <400>;
 	phy-handle = <&phy0>;
 	status = "okay";
 
-- 
2.54.0

