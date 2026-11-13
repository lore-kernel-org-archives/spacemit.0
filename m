Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576529;
	b=hyq/BPW6uks/ohQkk3krJkMo6X1U9TG4h8MwrVzNA8bnjF2UwgUvMHg6STU5hS0UFacX
	 oi1q2uPsMBVEhLt+LlV3MuGYo2QJHeOGl9PKhYkoXYH3GOiyjpheR4avt/7R2v+Ynlzi/
	 GVIUHJxvaKYPJlkvCSa5ydMle0niacAI/qWhvD6kQGvm5Cwwzbl5ajz3U5H+MoRs1HDgj
	 SkhOZWwerPiAkCN0kzg8mSvD+1K6hFuI4yXEuXAgxcLfACsvlzzpHCilVsySt+timi0Og
	 e+SXfJzvQIWAAqCBhKNeYvxeygjBv+rzBmlB3uGVTqNMM57rKthzsZUIgam+BkaueUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MRo7HIV8yZ/AJq7Hb5Yi36jH8E/ybOv5u/YJ01l5Ztw=;
	b=vMnokBowjlhISNSZCmiR8HrSUFrihDFy45IUpC6AQhs16rNLn/IHVdtn6/owzSmZgnSV
	 6p70yPwJQEGotZ2bhk3F55u1s60lD7Hsqi1HhzK9qlVQYUPBna4wlT980BP9Nbs73iUAr
	 Zr8CBe1WYiBg3QmD7fWplXMgy62xZGoNMzmGGVzvGoY7p23J6t1njLWJCt+4HFwPx2A10
	 GzURFwMyDpN5Yych2pINk+VFXOxlf4pPzg1V5w6I6q6sfFM4pGkExfdIRx24Ftx8jINg6
	 za0Vq+uqOvjIwImOwWRV0U/htlHXKiT0ZibOcXBEzJntjlhcY5/xtJdE+5/d5tNN8Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Fw9c83+/";
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09C7606B57D
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 13:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D09C7606B57D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fw9c83+/
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4b80834ce1aso1478625e9.1
        for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 05:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576527; x=1795181327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRo7HIV8yZ/AJq7Hb5Yi36jH8E/ybOv5u/YJ01l5Ztw=;
        b=Fw9c83+/aE3Mfod3a1irP9PUQCCaqcalatwyuqBidrDPro2J6VXALIlCccym2N6val
         Vcqez5UFkThlici/bP3HJqC+JZaG7S6nmD0LdnDO1V0y3NDUGPm9rsjGfrPKIP46CIHa
         E3DHWPTSAKVX1rJ4bo7YgfQ1cOCnHPLhsXMex3nYL432uczdOq/Ld7CSfzs+MYrvrpBY
         BeDtHpHj4AZMp8M/ld1E+ZCEWxDF82VsrrUwg5Z1NtUYASdY0HjxjeFw5Ckygm56bJWt
         XeNWQUYswAdTKV8MlUQ4HgMtfuCJaske9WcXT5C3GIX8yyV+AF5TIlXUhis3ha8VoM+E
         7ujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576527; x=1795181327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MRo7HIV8yZ/AJq7Hb5Yi36jH8E/ybOv5u/YJ01l5Ztw=;
        b=zsDdoo7vYN1TcNgSHR0vM8RXW/ndfi01RAuPigOfpREBjmvKCHEtN0Rewv4lv9CuoJ
         lCU2Gkytk4Pmshfp7RatGHlLlAABkRcnGQeTHr1qclkklTuRqAz40kcvF0sWHDmSYVNi
         tJxuclhxS5VlWM6YMxYXiAsiSfhjiSvv/OFfskn7TXUkPSOCRtg8PnpgvGIo9sKMqU3l
         404iWi4yRvJw/3CbLki14XYw/SnbxyRbBAA8LkpGSV3HTAfqVXwCGYn1bPZkgqwWr/lQ
         eJcR0CYqFljkmKEWX39QlE8XUUAYfO7AnjySuaf8krK6uPjy9HdMzXZsThBTnbtSWb29
         aZAg==
X-Forwarded-Encrypted: i=1; AL+hErGNlRWGvmuw0xsaCSsz3WYlKKRaMYwTnVzzYfbxVhMP++1YxWtR9FrM3mVk3LHF1y0FahoMtjfP/g==@lists.linux.dev
X-Gm-Message-State: APuU4Z8jl52pzAsPgRDDhq1QoNaGJ+0ozWlaMpDLBcmtUEg0lxM2OEYB
	kRYEPzylfRxOkjSPBGJJhz86O28bNtPA3gYO9UHHj60PdrfB5xl4zKzr
X-Gm-Gg: AYBFou2yuInPi3pgVqM+zpNJzDqq5ftxnYj5aqxKE82acX2Jui8ZqkJwEAPn30NsEv4
	zwmh/QXwdegVbzbj15ufNgUMf9Ua5jjR23bLKkrvE6VA/ZEXe4AcHxwW/vyBS1sWG3DP/7Rj446
	mhGKmXlCKLNgV7IFJR9qc5T1mwzmS0uVKptQNa68KwXIM5DrximhIEhoaGXVcdip+nWSkbP1FYA
	FbAwFa2mLBmr+FuhwTuyJb0orQkytJXgEWxIPESZQYKvoy0/Nb21ppouT2fkj4QCAkqzvfLT15U
	1U/9UZh2370uMI96MqvEdtj/aNDVB0/Vb3UH/scy4cLmmJTbCrupJywMcAV5CkfIUD2RP3roxg5
	LAxSHPbyW/FqkjnAaV8zSmy9colJS68ZKImRgX+ozFpIICz5Mjp1ys+zT+VjwVPfsx6/gd0tyEc
	IVNuoLDDyqTnTivSXaLWxSZwha4PCffbD56F5R1MvDWQj9U2Up1ZGnNFoKT5ipaiYd5TYLt7cvj
	HV3JYwOWXf395pG+ZGv1NwmzfLtd1TlGRhsIXPlTxaawTeSoz4AWflEnDCL4NXKKJt6fjNf2agQ
	bipBmjBKOEb3VW2kbbYVYceRmgEQSV3g
X-Received: by 2002:a05:600c:e557:20b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4bb55a583bbmr34500945e9.11.1794576527138;
        Fri, 13 Nov 2026 05:28:47 -0800 (PST)
Received: from workstation.. ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm4802673f8f.27.2026.11.13.05.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:28:45 -0800 (PST)
From: Ali Tariq <alitariq45892@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Ali Tariq <alitariq45892@gmail.com>,
	Tomas Hlavacek <tmshlvck@gmail.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	leitao@debian.org
Subject: [PATCH net v2 2/2] net: spacemit: Hold RTNL lock in emac_resume() and emac_suspend()
Date: Fri, 13 Nov 2026 18:24:35 +0500
Message-Id: <20261113132435.434615-3-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113132435.434615-1-alitariq45892@gmail.com>
References: <20261113132435.434615-1-alitariq45892@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The emac_resume() calls the emac_open() and emac_suspend() calls
emac_stop() functions directly without holding the lock through
rtnl_lock(). These functions rely on phy_disconnect() which reads pointer
with rtnl_dereference(). But since no lock is being held,
rtnl_dereference throws a suspicious RCU usage on
Orange Pi RV2 (SpacemiT K1) warning when lockdep is enabled.

WARNING: suspicious RCU usage
drivers/net/phy/phy_device.c:1831 suspicious rcu_dereference_protected() usage!
Call Trace:
phy_detach_internal+0x490/0x5f2
phy_disconnect+0x90/0xc0
emac_stop+0x114/0x626
emac_suspend+0xac/0x126
platform_pm_suspend+0x72/0xe4

Take RTNL in emac_suspend() and emac_resume() before the netif_running()
checks, so the interface can't be opened or closed between the check and
emac_stop() or emac_open().

Found by CI suspend tests on Orange Pi RV2 (SpacemiT K1). Tested on the
same board with lockdep enabled: 12 suspend/resume cycles without the
warning, and kselftest with no new failures.

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
---
Changes in v2:
- Moved the rtnl_lock() before the 'running' flag check
Warning Log: https://kernelci.cloud-v.co/scheduler/job/549#L2168
Fixed Log: https://kernelci.cloud-v.co/scheduler/job/589
---
 drivers/net/ethernet/spacemit/k1_emac.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 51edc95f54c8..d07d8a1aa5ee 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -2031,11 +2031,16 @@ static int emac_resume(struct device *dev)
 		dev_err(dev, "Failed to enable bus clock: %d\n", ret);
 		return ret;
 	}
+	rtnl_lock();
 
-	if (!netif_running(ndev))
+	if (!netif_running(ndev)) {
+		rtnl_unlock();
 		return 0;
+	}
 
 	ret = emac_open(ndev);
+	rtnl_unlock();
+
 	if (ret) {
 		clk_disable_unprepare(priv->bus_clk);
 		return ret;
@@ -2055,12 +2060,16 @@ static int emac_suspend(struct device *dev)
 
 	disable_work_sync(&priv->tx_timeout_task);
 
+	rtnl_lock();
+
 	if (!ndev || !netif_running(ndev)) {
+		rtnl_unlock();
 		clk_disable_unprepare(priv->bus_clk);
 		return 0;
 	}
 
 	emac_stop(ndev);
+	rtnl_unlock();
 
 	clk_disable_unprepare(priv->bus_clk);
 	netif_device_detach(ndev);
-- 
2.34.1

