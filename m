Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31FD3DE43F
	for <spacemit@lists.linux.dev>; Wed,  5 Aug 2026 06:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785912249; cv=none; b=i2pGAUXI1Me9xc4GFPPFHMP+HgqGQaz9UhrKIEB+KkoP7BmXKvYHKQCsK6xuyd58HQ+WfHVdrJHBC9D8QDL57K8D9d8aRIucGM37OPAm3ORpoJSNg9j33fEH/3V9T7bGVLFCgL1+WfflClcL3464fVZr02xqlS/hFQkZhneXUJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785912249; c=relaxed/simple;
	bh=ONk4+ySJ6/04rtJi3tnz+Bcm2WtGNmnRsdHa+ACx5DI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XIryKe2Q4K0MVLeFCePuDknsYbp77hAgIPj4FHv3ODLLR9uzfmFVkLZiUmyY5SM7JHkxgHn9p4Bla3J09psTpV0zdwT070pnP2R2N35uIVToLgAqw9cqMDdKsN+jO/emBM1BW6llDwTzQyCvpb0AY2d0p3bIZYYHy0x6fznwajY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jf/OUJby; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jf/OUJby"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ce98cb8165so7612695ad.1
        for <spacemit@lists.linux.dev>; Tue, 04 Aug 2026 23:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785912247; x=1786517047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFfF9vOjPIRrYjKrW5dKD1o7wgpldgxBl11pAMSS8hY=;
        b=jf/OUJby/toQfOrA+QUwNbclu5dAMGeMECUdw7iFDfa8y6TfIYl01lPtvhoxgnH+bg
         9Tf8P9l6WHu5B5sYx3ZcIiXfiG1W9wMYLbxyZOI1Uc3QKeiYja2PbEIjOEGXTjmGmLBQ
         H5JNZmtrYjpqlAJlFzlBublhFEmpnZOuY7kjj404JfOj+37fViHO1CKldHjWQltFB1iO
         Ah0bUKDUFs0G2HHelJ9a25v01/wEtl0k0HLGIHL9uxJH9YpYlZiNykVj27LUQ/jWIY5N
         2sBRu7DduqnW8PKnZ1YpXZmSfO6+RoMWVEiAtxjq6YA6Xf5ybq044ZHLRA5fD+YaoghA
         dH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785912247; x=1786517047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFfF9vOjPIRrYjKrW5dKD1o7wgpldgxBl11pAMSS8hY=;
        b=fOhE4CYJ8MUWJgcQT/hg4NePWrLFhNOjt1iql4zF0gXGSXBHGe3DjWRxASPfU9wI92
         giG7XkeTxrB2t6gKIt+PjrsZQYwZqHvHl0iwBPBu6bmhiBdfgG7a3narrJKZ75fhQli6
         WQjSxApfFDaLLJVWO/kylL5yr0ihWR6sXfQ3kF+YiV6u6qxUqsOEqbjznydhydMJ0xDz
         arOalxXhXQu2iLJF3IfpD2SzOJhIiXkXAZV99JpVBnhCgHiE67vZbXT6lVdVT9C+b2eD
         TsVToBhRf2/Cetx6TU48ADaMTLVqDAH58W+IAv/aA6zPWvVYVNz40d5J+W0Zrydhly9w
         E4pg==
X-Forwarded-Encrypted: i=1; AHgh+Rrq6Tlhe/ErhT/5lyjU10KiwJMXgtVWD6dKF9lVMs+fQc/n+zI5H9bdriGP+JgrZ4fHXa0PISdkGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYvtM0ZXHqsEsUVHVRuWoKBLYIYhyQAbQ6hLqRH2hZZuYczYr9
	/yaK9s6Z4HsCY8QnDynr2oLYalQUYItlVd6qX3OYxGieo8ThHF7Cpjzz
X-Gm-Gg: AR+sD11Grd5skCj4bS9O51R5OnUV5ew18snINnDCKPtkfqurX9bsViXGEa7eIHBZfF8
	NSONPqHTOpdr+gDmcb/1fYbt914sYL900r5zmKgzMz4UMRWQIBahoKlQ8JUa1afy5WkkuqsPlhX
	cW9JPVQhPSRbhzY2octCN/cg5iYWAaHszmT2P4V07gfXjs/Cx/PGXvAREV35GE5wOfFDz0c4OQk
	RPAGSBgyRtUPoWMhJOv/+18Tstmvm/OdDLGbfh1FgKJJRoe6blHyfItrYGvlUmZKMqoLReqVhNh
	HDCJn1m4GBl87Icb6wPLvR2kbnxHG8AokoY6IZkRmSG3Y0fL8Ehge+zd6w5g16yxE4PcSw6u36H
	SjwewSadXnBgbR511+ibpsmfEKfFqzfMC2dFvCctZO+z5KVyUudNzC2taQ9gRwNwOQWuAjr/gB0
	MREsWsAzpClXHpKwuPlOy+Te1p+uZUDhwWJKGxEugGckUiycQGqzNuLVcA3M/x6UDvw9EnEoITs
	OVNZGyDt6rS0MwuMkxtm9uqjegIqHLbb5YfZWzO5Pi2BJlEnAQP+O29kd6jeXCzw8RBGw5ULtoI
	i77j4A==
X-Received: by 2002:a17:902:e551:b0:2d0:401c:2edc with SMTP id d9443c01a7336-2d08aa1c85bmr95025355ad.1.1785912247199;
        Tue, 04 Aug 2026 23:44:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa491747sm14094435ad.39.2026.08.04.23.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:44:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Yixun Lan <dlan@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Goko Mell <goku.sonxin626@gmail.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] ASoC: spacemit: advertise only DMA-backed DAI streams
Date: Wed,  5 Aug 2026 13:43:48 +0700
Message-ID: <20260805064348.44283-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The static DAI template initializes both playback and capture stream
capabilities before dma-names is examined. As a result,
snd_soc_dai_stream_valid() considers both directions valid even when the
device only provides a single DMA channel.

Move the playback and capture capability initialization into
spacemit_i2s_init_dai(), where it is performed only for the stream
directions backed by a corresponding DMA channel. This preserves the
existing capabilities for devices with both "tx" and "rx" DMA channels,
while preventing unsupported stream directions from being advertised.

Initialize rate_min and rate_max together with the other stream
capabilities to preserve the existing rate constraints.

Fixes: fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the commit message to describe the functional fix as 
   suggested by Troy.

Link v1 : 
  https://lore.kernel.org/all/20260804043036.22065-1-phucduc.bui@gmail.com/

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

