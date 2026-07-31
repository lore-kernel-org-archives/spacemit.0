Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D78640B104
	for <spacemit@lists.linux.dev>; Fri, 31 Jul 2026 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785492980; cv=none; b=eRzu6XCSvfgv12y9VwZnl6F4h6/PF0CNj2e/PmMhFMLgKk+2t3xXHJwbKGUA/3FXnVXHDvLfeuhT4cA38gY2Ip171b1hkbh3zX7zG9HaqXT3vkXDYkD8Gsj6rPkwDMcyzblD7TxI28fo0/IAHjWV4u7o/EwPEnYqkgid8vlYjVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785492980; c=relaxed/simple;
	bh=Oq0qHCMJTDXMvBr5bsOFLCduogKj3CN2uMulTxtRHKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oZx9T3QViqeSzzTHVYvVlZCS3XQ7MgAFsl55GekTX8QviQi4cYjet53jmo8STSAroMnrcbpx/xKyOJcQRxa85UyGEyB2tTgsO5f6F+hUaDR09i/0joM6AXPRQ6Rcfgn0OeFReKVjmY06wqSI2X+yXgjJlL0SpcH5pakmG5QKz0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rrsttUL1; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rrsttUL1"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so892906a91.3
        for <spacemit@lists.linux.dev>; Fri, 31 Jul 2026 03:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785492964; x=1786097764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhY5pmRQ6A67JZa+NLW72z8V+CYSZWnDWCHhcpLOg6g=;
        b=rrsttUL1fecT0qVOoeyQhHv11KJmVbV9ZvV6cHPgdnPt+yUH40kvZ/vcdGBhEXBVRO
         h7kDLuP6wU/bq9WCR5ijlmoKEkf32kPLTCA1veYbUyo1/oLr3Hb8if0DyQ08LnhugN2b
         iuTrT/8/iz640GYXoQOu8NtlLpS5s/kZKHRko/mhwS1kcps7Pt/axdbdOztod8iW/T1K
         fsXnVYXXh4uE+UW1N7uUpX0ma3HHM1ksCreczd7t597n7J/PQgVF+rfa8smNFf3BfpSR
         +4pSCgrYxNc2XzdIMbbACp1+LFK2ujXzRcqa6fSIi/O3EoCy/oLk29ceAC9l+b9KjTpA
         VDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785492964; x=1786097764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhY5pmRQ6A67JZa+NLW72z8V+CYSZWnDWCHhcpLOg6g=;
        b=nt9Xx/JSit5SfmSRfgBPap+o/azqlE40qhRKmHqWFw5sfjuN+xFQNgTyl3Ux896jfv
         bfZEzIJFgTPmRBaDKaKLVgLv2F4qugKVxEbhXvaXTJtacPc3APG7kbz6yyA/rtmfKLcA
         IAedk8D1KVmgP4i4G29e5r4+++egagY+X59tSxtvRGL3wZ1d2aJtAb0LDk15tJRDzXId
         GAXJZQwixFwC1b3vOEHNnsBL2PR3IHJdC8lBPsR50clEkWfod3kbzVJoz3izBmtIlP+5
         PrtC/Hz/VdOIBsigFEKwe4fevLH0QV1XzD67AdAoiZ9Npyl71Av7mQqP0hc4swU3P0FC
         koPw==
X-Forwarded-Encrypted: i=1; AHgh+RqGoqY8vbK3io/Sse1XCwpzR+sHv7MhYXwL4BVfNcxJL+3n4NHcgzrawu2eDVaOBMCgNQJcVrHBaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3ymyO8Zp8bc91s5hTi059n7JrU+TACZMgfMhiwPKJ7Zqts3qt
	d5mPsUQI3fLeslg0EFORxTnsYcbP4NODli5736ThlnNc+e5uFjgLP4Vf
X-Gm-Gg: AR+sD1226kz6dxP7GvfLxiPCkeP0qtsrYew/srSrLo7cjqbao1IB5oQxBz6tNsR7wsn
	NK4PX2SicdKX/IO9uL55dV9/fuRutlOARc9eRTt1VlNWyzXy0NmuFWuIO8RzY0JYFMg3VDXK/l/
	NYQ89SjjOXUj2Vq4ANur1B/VVNnG7lH7YZ+J8CAlNX9Bu2gPRZ9PisDHkhBneuA3GZL5CKiKiVE
	swx9xEO84dJLTlC2D98/MClUaKa2o/qlthdoyOrvKfRb1IhTTbpeDLE5YFtoOJGqusG81AcYMKZ
	EJ4vek8zdgs1urjDXGZNZCxFFh1a/CpOGfr5OolokwPBvI5PL/2KMZ0P/BZxN8vRB8XpBNSxuEY
	OP6D6KZWoS/GckA6wWDFlaaRVnZL3y1aNahviYUa15YRMYvx5rBeLCUezIsuFyysTvjN4rJt6M0
	tzSHPv2XcgX2tK2amr85TvphZhc3LkyCIC7UJleG2phlSgU2wHQ1LVa750xRNlOPTB3EFv2AJXz
	pPLiP3iGLBZ6R+p7FfzP8HrDXQiNbq6WomQ50og4VMFxk+8ZJdfpyIFOR/hmoudcI3Qxo1UOFod
	GE2sjIzR3IvcuRM=
X-Received: by 2002:a17:90b:4d8e:b0:38e:895f:25fc with SMTP id 98e67ed59e1d1-38fb14a50b9mr1388374a91.38.1785492963980;
        Fri, 31 Jul 2026 03:16:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2ce28c7sm509733a91.16.2026.07.31.03.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:16:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Yixun Lan <dlan@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Goko Mell <goku.sonxin626@gmail.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: spacemit: Drop redundant error messages
Date: Fri, 31 Jul 2026 17:15:38 +0700
Message-ID: <20260731101539.36290-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The called functions already log failures where appropriate. Return the
original error directly and avoid duplicate error messages.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/spacemit/k1_i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index cd461f2aa756..64510c9a1a89 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -478,7 +478,7 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 
 	i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2s->base))
-		return dev_err_probe(i2s->dev, PTR_ERR(i2s->base), "failed to map registers\n");
+		return PTR_ERR(i2s->base);
 
 	i2s->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(i2s->reset))
@@ -495,7 +495,7 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 					      &spacemit_i2s_component,
 					      dai, 1);
 	if (ret)
-		return dev_err_probe(i2s->dev, ret, "failed to register component");
+		return ret;
 
 	return devm_snd_dmaengine_pcm_register(&pdev->dev, &spacemit_dmaengine_pcm_config, 0);
 }
-- 
2.43.0

