Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB8E25FA10
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894267; cv=none; b=O4HpHO0PZ3YEOGZvmIzpQXWBuzKFnqxLNa2Ww2ypLhkRtH93b07CvmrzElYKmtZz/77v2uT0vj8jdItgcy13DzcVtwQvBHZvQJWWdps4LRuR41S5NejJcAkNomGAzG50uH7+TmyUzGKszDNwIDn+hnh+619okEYm2PoiXJfh5k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894267; c=relaxed/simple;
	bh=XYOEb0zf8jXCKwsHsvzzu3YtIHkS2WRUQr2IbZW/Umc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jKUHQMeqTpSaKb6h4oDcxdXtCjn0nIposKP+Yqew9Iu+9/27+sIpZOhEBNZgw8p2ldKRM4ee6r24Hy41/zOAOkmqxuSej1QewqttaFqVGMgpwYofvKufbMwobljsLsmBnojaG4CiTmCzv9fy3nqU15T0ZlFO1Um03iu3vcLfu0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Ihl9jg/S; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Ihl9jg/S"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7ade456b6abso3585930b3a.3
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 06:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765894263; x=1766499063; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x0mQ2j55HYzsWAqKi9hLFK12hbv+niMldudmD970L/A=;
        b=Ihl9jg/SFYk1kSbUgN7Yy0Bvr51ahKD29MgN21g4RoFbgWy6mCUqrdwx48WKprR8ol
         bV82m14vSTlSVJQegv9xZMrYCwCR2cbqVJ5YeCSwLC3l5sx/w3arBwxfaDKDNyugQwe3
         5zZs8lIyEnWtg7HZms2a5T1Hwxstzoo81mkb/B8DZdmKCZYNBzkOwzGLV2tBFc46O7Wv
         Pz7QzhVwrCRk39/q6iNGP9DqB5ksKutVnhQv/MkYswaSHBmhNLTnUerPpWIJ94mhzBJU
         SkW/JyGXgBwn69WESiHO623vbbyD7iky+d97Hj6L0h97v9aw2fd9Ss5tWiJCnKIGKqVS
         u/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765894263; x=1766499063;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0mQ2j55HYzsWAqKi9hLFK12hbv+niMldudmD970L/A=;
        b=rFQ1UGWgzK3c6uTtmSLvyl3n9EdSC8mkEHANTlolL6nZw6ofJ6JodiN581QGvO6tns
         ul65mwvaSAJtSXJ+fc1e+x4kFyt3bkwxz3Dh1gMmiEXjFpwsqbetmlFR3ubuXbSVCE2f
         2MLgyI/NiL8d7qKY7b2J84WDxVyoOLwzwJ19KnTDEaxRjj7SFm5Da/+i2khx72lhVsGP
         bFNUDUt7hMHrOnjvdqzXarGpQttMUj7r7qotb56mqe1qs/jm43moWmfzCM5cW8HECjWT
         2KtCIKqs5v5biGPtXriWwJOtXF0pMAlQdVCFYFKVcrECcKPU1ZfwyN9vNCV36Izxn4LN
         Jc5w==
X-Forwarded-Encrypted: i=1; AJvYcCUlT26mu/mR4SOLpjQkGIZwv62n320fRH2JDCmIzzW+nv05+8VDumcel7A6QqcHONuRwPyOqPZoMg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx37oGtRYdEaO8Ac+I2d9TEmlekQy5W6RSrAB7gnEMq3bI8Zqhr
	HUfZWsMzyG2uwcUZBHIXgveniVeF0VLQcPkY4xbEWtc/2i8/8y/mKjz2YQTg7SR8b/M=
X-Gm-Gg: AY/fxX5v9SIy4rOa1gHXmc/bdRyX/d7bxC5y/ml4joe6evakW9kpiq7eIyi0pLKWfMe
	n6R8vcYA0w9eCVyN37oCso6ycRLJ2W/uJZEzUwLagg67mWTax3elns/x8m158c/qVncBlLQ4sAt
	sy/eeIuN5RSqmm9FT1yK/twaCE6U/Jy6q2R/MJowZklwlVeG/NOx2tDmhG36gZyByB1AmgNBjDB
	f6TsyO89R5eyzzZqEEa9Do9BkYU1R5O4vuM0ZTEJTs5nAXWqcNSx9+2EcJ8vjvA02tcOB6tABch
	Ao/Jm9s3n4tixF0b8ZWpMjReUKpFA6QD6H32jz3yKQ0H3Rdw5QtvEfgqO9i5XG3/Gchf/HaVQa0
	197FMoItBm34btu7BoXqtf97MnJOUeE+VnCxtLtoDgqKb2EdOckRxsZjyhZTyI8Oy2wfN+YVGk2
	Ks2tot/TsafKxQRIBTOB5e+I4t4ZzXRtQ=
X-Google-Smtp-Source: AGHT+IFdznc94KTDkz6BoktpmFeuIds91RWVwGw8kUgSdrZJ6fQjtIW9/MuumcftUmESsfRMEb1Hmg==
X-Received: by 2002:a05:6a20:e210:b0:35f:10a7:df67 with SMTP id adf61e73a8af0-369ad9d21c0mr14335397637.17.1765894263443;
        Tue, 16 Dec 2025 06:11:03 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe200077sm12055352a91.3.2025.12.16.06.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 06:11:03 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 22:10:06 +0800
Subject: [PATCH] dmaengine: mmp_pdma: Fix race condition in
 mmp_pdma_residue()
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-mmp-pdma-race-v1-1-976a224bb622@riscstar.com>
X-B4-Tracking: v=1; b=H4sIAD1oQWkC/x3MTQqAIBBA4avErBvIof+rRAvTqWZhiUIE4t2Tl
 t/ivQSRg3CEuUoQ+JEo91Wg6grMqa+DUWwxUEOdItWjcx69dRqDNox2GMzYkpo2MlAaH3iX9/8
 ta84fhHNzfV8AAAA=
X-Change-ID: 20251216-mmp-pdma-race-d77c84219b2c
To: Vinod Koul <vkoul@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Juan Li <lijuan@linux.spacemit.com>, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add proper locking in mmp_pdma_residue() to prevent use-after-free when
accessing descriptor list and descriptor contents.

The race occurs when multiple threads call tx_status() while the tasklet
on another CPU is freeing completed descriptors:

CPU 0                              CPU 1
-----                              -----
mmp_pdma_tx_status()
mmp_pdma_residue()
  -> NO LOCK held
     list_for_each_entry(sw, ..)
                                   DMA interrupt
                                   dma_do_tasklet()
                                     -> spin_lock(&desc_lock)
                                        list_move(sw->node, ...)
                                        spin_unlock(&desc_lock)
  |                                     dma_pool_free(sw) <- FREED!
  -> access sw->desc <- UAF!

This issue can be reproduced when running dmatest on the same channel with
multiple threads (threads_per_chan > 1).

Fix by protecting the chain_running list iteration and descriptor access
with the chan->desc_lock spinlock.

Signed-off-by: Juan Li <lijuan@linux.spacemit.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/dma/mmp_pdma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index d07229a748868b8115892c63c54c16130d88e326..481b58c414e470cc08812d5a9fe7283cc48e5827 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -928,6 +928,7 @@ static unsigned int mmp_pdma_residue(struct mmp_pdma_chan *chan,
 {
 	struct mmp_pdma_desc_sw *sw;
 	struct mmp_pdma_device *pdev = to_mmp_pdma_dev(chan->chan.device);
+	unsigned long flags;
 	u64 curr;
 	u32 residue = 0;
 	bool passed = false;
@@ -945,6 +946,8 @@ static unsigned int mmp_pdma_residue(struct mmp_pdma_chan *chan,
 	else
 		curr = pdev->ops->read_src_addr(chan->phy);
 
+	spin_lock_irqsave(&chan->desc_lock, flags);
+
 	list_for_each_entry(sw, &chan->chain_running, node) {
 		u64 start, end;
 		u32 len;
@@ -989,6 +992,7 @@ static unsigned int mmp_pdma_residue(struct mmp_pdma_chan *chan,
 			continue;
 
 		if (sw->async_tx.cookie == cookie) {
+			spin_unlock_irqrestore(&chan->desc_lock, flags);
 			return residue;
 		} else {
 			residue = 0;
@@ -996,6 +1000,8 @@ static unsigned int mmp_pdma_residue(struct mmp_pdma_chan *chan,
 		}
 	}
 
+	spin_unlock_irqrestore(&chan->desc_lock, flags);
+
 	/* We should only get here in case of cyclic transactions */
 	return residue;
 }

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251216-mmp-pdma-race-d77c84219b2c

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

