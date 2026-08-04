Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9922343D72
	for <spacemit@lists.linux.dev>; Tue,  4 Aug 2026 04:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785817854; cv=none; b=RnQMU6LMsI2yhkGrBTRebY/MhhVHu3tM/DXf/3NU91SCzzLbhDKtaJpP5/vQbK8gpRPFe18kH3eKn28d4sVwtLtjjERUPL2qv6zKumne2oQYvEHpVSsTLB+kZMVM0JmYcx/hY0mkKpzlt+oe5nCTlLNspsD0nYRxZSGIaMG1g58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785817854; c=relaxed/simple;
	bh=OAETXZTVcG4Rpgb01BW+Bm+y6f2gek5DmYAEnw75v6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WiC5ZH6Cbz2SQKp/LZvxJnq9OiffKu1qqVizXjXH4fM6Icfw39O9PY4+DwHksSaKWHmHA2SylyDolPxHPLGv9ewbzLEJf8kiI0chozCn8Xkr5R/g+JN4FZpXyOJsdzKc1irkmzLmudRz+29AK7lLgEHHiqbCJmAaBE7KjhhG5do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ta8MgaaS; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ta8MgaaS"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cacb8416a1so41114175ad.1
        for <spacemit@lists.linux.dev>; Mon, 03 Aug 2026 21:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785817852; x=1786422652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7yaXhmEwb+mJHwyLaCJwLr0hoYPttqtvD7BNNFbot6o=;
        b=Ta8MgaaSCy5k0FAavNm5XFdUGByfIYizrVSxZdLNsmoDNh/hjTHuO05upNHOs5H7hG
         4cCG53zX6yJplk5/M5rbVB3NUXZ0t6BKaWV4yYE2Bp+M5xfuTTKfcG0vFh3EUVX21Ntb
         AoZG7l+g7z2BMy7foEIZsYUtMrSXm60wKj110289z46qpl0Ecq3VBWcuHk/2bcsca/Fr
         7kjZIQCby4wUEu1GbtFUBc4cMNE4Sw6HY5fvluSEnDoFU7qv+4YGEDa9+BnTg2zRr/WG
         gmVU7nsP4466UyHLi6InjnE10b9iRtMl1sSt8jZINf1XJ27liuD/O99A3nQNrdmcYM9/
         VCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785817852; x=1786422652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yaXhmEwb+mJHwyLaCJwLr0hoYPttqtvD7BNNFbot6o=;
        b=QvN/+0B/QbKN4o2YKQsuJ7cLthzppzpcXrPEyvp3W0UFBKYRZRYa2H4Cb9stlWlEMG
         gzG+yx2VsPK3Xu19Nm+Jh+mMNkwm3F9buE820IVMP4K6Z3CyZkYAPsaBqyctvp1itiv2
         o3Fsg3KLU5U0HpdDmV/JpqdSjxYJBBnS3O6Pyt67RI5izAUDV9qHes6dAB554sKK05xT
         YJeIwh3efoe0MsXVfvasdUqaOiSHR6TBonRNgW0ZMCSs2P7WuYN3BBuZxDo+6pOem2+r
         qN9BZPl48kqmda1TSzsjGjbIQt883WYTsIzh6YbqyWIHb8CbQ/sh/8SGEirpXZoVt+XD
         P7Qg==
X-Forwarded-Encrypted: i=1; AHgh+RosU81vt7Sv0xLF9pOvDeF4JC9jf90BG/bQKNR3FjK8Vov2rZATwVVSYwi3glIoszREYeEgKRDurQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQxejbgL316sZniDefUdYmtNZxA3BQmE9j5aCwLyRD9OLdcbUN
	bgGXL8XU67Wx1EfbTqtrtMjGthjo3nGR7UQ2eF1oskK+yCL4hCvatEQs
X-Gm-Gg: AR+sD12Udcc2HyrPxQ5XcJQxEBKmZIBw+UwLUYF2Vzg5RNlUEKd8FFP5zYz8m7kAaZQ
	XRjjlmfHUlpCr1jSPA6s6rPWNOMhusiRgGljTaPRyeRQd3uyf4MMiG0mITo71PQN2Qq+04eeRL9
	3TKmMcRFRT1FUJuLZLfWQL7fX4nXSu0JLSZ2WUp+vmJlpp1mHxTAfgtxHSbsqo9dPNXEC6BsUUO
	VtUwDtaShaJ5JPhDMlcxJPg/fnnS6QpmNH6wCx0k1j2tQOn8MVTNcgpamhkrwlIoNTSQ9cqzCXz
	rahC5JZE3CUrJjWLSP7Se+BW/hBd8m+6MKs+fw3mnfoICbLvMa9UGi/HVU6gbaFZTiErkh2W4Eg
	2955d00zVW6NZ6F60oH7408NaHjGbKuzgoquYW/kVvkoSnGQvkNKWxVCNrcRU05U4SJ3RxCWzFQ
	BEFep+JDOfrl3qO0kUqmaOCJPMmSSNPNdudzEDff7T/+OUOjbfHfxpQndPkTem4wqrpiXAaVkW/
	0ju+Gm22XUg5jT5Ki9BTuZW7Gup6nOykkojO1QVWN8jOCy9bc3i7RYXl3YMP7/hhgncBj0f5Ghn
	9SAP
X-Received: by 2002:a17:903:390c:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d05218984fmr118913895ad.8.1785817852050;
        Mon, 03 Aug 2026 21:30:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae58d8bsm46026045ad.26.2026.08.03.21.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 21:30:51 -0700 (PDT)
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
Subject: [PATCH] ASoC: spacemit: Remove redundant DAI field initialization
Date: Tue,  4 Aug 2026 11:30:36 +0700
Message-ID: <20260804043036.22065-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

spacemit_i2s_init_dai() already initializes the playback and capture
fields after duplicating the static DAI template with devm_kmemdup().
Remove the duplicated initializers from the static template and keep
all field initialization in spacemit_i2s_init_dai().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/spacemit/k1_i2s.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 2d5ea1fd5d49..28a762769253 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -354,22 +354,6 @@ static const struct snd_soc_dai_ops spacemit_i2s_dai_ops = {
 
 static struct snd_soc_dai_driver spacemit_i2s_dai = {
 	.ops = &spacemit_i2s_dai_ops,
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = SPACEMIT_PCM_RATES,
-		.rate_min = SNDRV_PCM_RATE_8000,
-		.rate_max = SNDRV_PCM_RATE_48000,
-		.formats = SPACEMIT_PCM_FORMATS,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = SPACEMIT_PCM_RATES,
-		.rate_min = SNDRV_PCM_RATE_8000,
-		.rate_max = SNDRV_PCM_RATE_48000,
-		.formats = SPACEMIT_PCM_FORMATS,
-	},
 	.symmetric_rate = 1,
 };
 
@@ -399,6 +383,8 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_dev *i2s,
 		dai->playback.channels_min = 1;
 		dai->playback.channels_max = 2;
 		dai->playback.rates = SPACEMIT_PCM_RATES;
+		dai->playback.rate_min = SNDRV_PCM_RATE_8000;
+		dai->playback.rate_max = SNDRV_PCM_RATE_48000;
 		dai->playback.formats = SPACEMIT_PCM_FORMATS;
 
 		i2s->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
@@ -411,6 +397,8 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_dev *i2s,
 		dai->capture.channels_min = 1;
 		dai->capture.channels_max = 2;
 		dai->capture.rates = SPACEMIT_PCM_RATES;
+		dai->capture.rate_min = SNDRV_PCM_RATE_8000;
+		dai->capture.rate_max = SNDRV_PCM_RATE_48000;
 		dai->capture.formats = SPACEMIT_PCM_FORMATS;
 
 		i2s->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
-- 
2.43.0

