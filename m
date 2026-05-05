Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BD3353EDF
	for <spacemit@lists.linux.dev>; Tue,  5 May 2026 01:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777946045; cv=none; b=hJmDd/nQGhLYsj3dY9BCV1Tr64t6wD3KbFCQmMkIDO2MvtiJ6IS5Sdy8LQR6techejCKTrwpQ2+eiGcfXyMfiO98XYpoy93HgzSiX3zlIq+lmSdlBv/qrfCiN2R3UNJHqhBrlCwFxQlmg9m/FNgleoD8E3oia+DFxL2X5V87YWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777946045; c=relaxed/simple;
	bh=bCXcH22VETc/1TUN/+hBoB9VD44HhAx4Bt4mZr0aROE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RrN/QLJyoShI5Cz2GytPxMJWdRDNHIV+mOdfz+/6aqzFCBVQSPpcUOi8mg0Vd1JjSFfXXKe2V3vduDEuytmBpuzMYZEfG+Vo8D1B5oQFlxpfoUduBSz+Af+KVb7qo363QtDjRJvbnk5q4SoU7YwU9B45lO3DHzKC4qvndw7wa+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=KybR+5Ii; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="KybR+5Ii"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso3620728b3a.2
        for <spacemit@lists.linux.dev>; Mon, 04 May 2026 18:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777946042; x=1778550842; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A4fW5IFCF+h7MNSs7mItaLMetGKpr2bIN5LAG6vg93E=;
        b=KybR+5IiyVtWBukOYou32K5Rif0TCEwKV7CEtbJFBI+CkUkLqM2jjBsDB/QlYD2d92
         UOZ8mg83tydKiHrvL9i5+RmVJ7vQo5P/z/m85KdvrD+YyCySDsuVEsoV3aEH2Ivm70zH
         5zVKMRU/wXXzfZ8S1D0a57O6PzPMztaUroH2JHNwsL0YfrWmo24RZO9tms+u/a5HQX3n
         X/FpZlJupFRDkg93PyhswaIbcD/A81bvo9xTVnRG4EjszTA0y9FqXqMc6GULKBoM6SkH
         xfkd5qrjLoVN/Aa/mfBggi3Yh/GElzdXcyJY2RCMfrCUHuzOs07npoY2MmCsPbknnK5p
         X24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777946042; x=1778550842;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4fW5IFCF+h7MNSs7mItaLMetGKpr2bIN5LAG6vg93E=;
        b=OCqs97K3NdTBTXsi0KfRs+ibMie6xgJExcsksLur2I5gjsvskWt86bwx+oOFMHD0ng
         ZSeaFXqPQcxddRolRcSAhvNaM6L+FH2l47qgvXAB1RPJqgft69b7xrfYbxRwLSIk7LP+
         MqSF+0SOFTazTjWtlS6VE5JOEzRrFO3uKw/5ZlYOrg8t0rlJo8YhrL+cjMdNxvY/a458
         gKgniFn9+2rzPxda0/yIRBoNJdfok83C0igwOa2aVG2gNBh+J9u5hl9RSEalsU1WilAT
         hH2BqYPIFJhyp1Z+NtrK35BiBW6gkNaO4OgvrwrYoUXtHJOI3boaebC6tGEOrzPDTQ73
         DetQ==
X-Forwarded-Encrypted: i=1; AFNElJ8660haY5pbBiagkuSnDIhL7XBZANqlUkyvROwa/F17mP+0GXpK6MA7wDy7Etm7DOA96AIWxVqq4w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgbAFgAbD2c7yGK+lKTDh5+bBdRXNAko/slIN8XoWCfBnA9vUu
	POQ+XuWxiD8E409sUN/V8/N0rE2IZpdaHCAHUm/cYnY7+9gGjtg+exPSGX++4JM1UuY=
X-Gm-Gg: AeBDievkCsFT1reADonh1PoAV6oCE08bH50jfoMudN/h2jkjk3lf0VfPAXM9+1M4bKo
	f7ERqlxfsZ7LPA+l6aTRUZkrIplOf+2ZWQQ5WA6qx8QSpLZURLPV6+p3hHuZLvH6f1Uyyfgjuys
	hTf2CiktOtUTETIXkYeY9jQVpSFez6myGQvw3wLVbi+GNyd67l/3RfUG/Pa2HzaadTUblsnqbtn
	FwexQVuvliCFIwtgUePfVN2I7tXDPqk89F50kiDoe5JYRVXpDSDLQAiBCGOyfGjlhBVpkPtV48k
	59PX1QZ9z8mF/0Yr+iMd4BZfFXIMZlFPtpZKaRcnKHZXpOu6bwjijFMNYruWBdQogQmhQw9zq4l
	YV5eL25Xg3A58tvQbmwwsn3rmtq6klmIuMxCXd86QquDmHeFW9jEt/3OdV3r8Blet/Vu84hpTqo
	dyVsP98bn6XAW7B9/ezzB2aiRPoY3K6wpFy+c/S3TqTqclHr/woZZYXBBrnM8nsyBJ
X-Received: by 2002:a05:6a00:1250:b0:837:a211:4edd with SMTP id d2e1a72fcca58-837a21153a9mr6252120b3a.3.1777946042159;
        Mon, 04 May 2026 18:54:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3016])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a4bffsm211375b3a.56.2026.05.04.18.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 18:54:01 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 05 May 2026 09:53:34 -0400
Subject: [PATCH] spi: spacemit: add u64 cast to NSEC_PER_SEC to avoid
 32-bit overflow
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-spi-spacemit-k1-fix-overflow-v1-1-77564c2e4e86@riscstar.com>
X-B4-Tracking: v=1; b=H4sIAF32+WkC/yXMywqDMBCF4VeRWXcgBqymr1K6iHHUsa2RjDcQ3
 73TdnEWHwf+A4QSk8AtOyDRysJxVOSXDELvx46QGzVYY6+mMAXKxDof6M0zPnNsece4UmpfccO
 qdK6pg/XkStDElEj/X/7++FuWeqAwf5twnh9PJHf6gAAAAA==
X-Change-ID: 20260505-spi-spacemit-k1-fix-overflow-8799dbc2ae97
To: Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@riscstar.com>
Cc: linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1

NSEC_PER_SEC expands to the long constant 1000000000L, so NSEC_PER_SEC *
BITS_PER_BYTE (8 * 10^9) overflows on 32-bit-long architectures
before the result reaches the u64 nsec_per_word.

Promote the multiplication to u64 by casting the first operand, which is
NSEC_PER_SEC.

Fixes: efcd8b9d1111 ("spi: spacemit: introduce SpacemiT K1 SPI controller driver")
Suggested-by: Alex Elder <elder@riscstar.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605050437.RS6mmV2b-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202605050317.Tf9j487w-lkp@intel.com/
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Hi, Mark

This is an incremental fix on top of your for-7.2, addressing the
overflow warning.

Verified on BPI-F3 with a GD25Q64E SPI NOR, read/write/erase still work.

Thank you.
Guodong
---
 drivers/spi/spi-spacemit-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
index 99db429db0b26..215fe66d27b4d 100644
--- a/drivers/spi/spi-spacemit-k1.c
+++ b/drivers/spi/spi-spacemit-k1.c
@@ -390,7 +390,7 @@ static int k1_spi_set_speed(struct k1_spi_driver_data *drv_data,
 	 *   ticks_per_word = BITS_PER_BYTE * drv_data->bytes;
 	 * We do the divide last for better accuracy.
 	 */
-	nsec_per_word = NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
+	nsec_per_word = (u64)NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
 	nsec_per_word = DIV_ROUND_UP_ULL(nsec_per_word, drv_data->rate);
 
 	/*

---
base-commit: efcd8b9d111177d48c841d09beca43b15d5b9e5f
change-id: 20260505-spi-spacemit-k1-fix-overflow-8799dbc2ae97

Best regards,
--  
Guodong Xu <guodong@riscstar.com>

