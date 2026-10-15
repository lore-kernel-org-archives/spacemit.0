Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9782056E072
	for <spacemit@lists.linux.dev>; Thu, 15 Oct 2026 18:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090600; cv=none; b=Qz685C7fxlJpRkq5fcxDgN6ahhyxCyoKbumAjuQb/XEyTXCw+I7pxLToZ3qXDBaQhiyGIEQh+ZNMXV2tt+wr1fleDKVd5lrxC5+gywFI6pf7xvsYoyXpSNApA3PhtYaozPrNRJ6oDyATPObWiLNLVEP93Iqi6S5ssneRO3wwSFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090600; c=relaxed/simple;
	bh=F1nPu9wpy2HTwHGav8g9uO8FI0WZgezRY+zItOCC26M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZ0K8NbfXoikxXkbpqk7Co5zQlEnTB/GrV0yJq94VTdQfV57UMeaCTWPwDtpMvNnSBb8VKd1K/eUMHOGWW3waOXw2Rc7ve1tzTj78WF2h7KOROgYcCoaWH62uI5e7h/4yMDdWFC2oxY2Cyjm/7FLqXWwWIkkJqzNkulunSL2FJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpBlvPK1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpBlvPK1"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso21764405e9.1
        for <spacemit@lists.linux.dev>; Thu, 15 Oct 2026 11:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792090596; x=1792695396; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ni61b90g9iD83/OZasQVP93JejUptEHkbkJ81F72Nc=;
        b=FpBlvPK10b6n/Uj7Xz5GCCMXwwsNCoAUV0OgzvFTCfjgW282sTSHvj2gHVQRUqcyCl
         dGmxLg5tm7OVUfnEt36thFhNJRWBJfQVCMCsyY+rx4K7O7Zum2vyt6FLRQeX9kD7uVfn
         BUQQnAUzdn2AeRZZEVeOAjdGqT3+kI1lpS2gti2mUes8W9FA5iwIqMLPqFGPQA1ruGks
         3uhNf2P+2w2x2Dv9fUMKxDqK9WutOtOoy8La5GE2Ax1FaXSgDGoICIjCCiBuMFAyMIos
         NXfmv1Jr4UH1JInaEhU5i8hEw5y3LvwEqDrhTv1mFmgaw9HRCwRNDwwa5mGFsIvx9WOF
         KGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792090596; x=1792695396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ni61b90g9iD83/OZasQVP93JejUptEHkbkJ81F72Nc=;
        b=wzeJh0/TuMeHhMD+cH6Hd3AGhxUG1Ot7oX3tMDXLEUw/eGorpuMF4A4ImyOEjo08vU
         2DBVw+ATCZHQSPRpkKwhFxL0j15f+tcG8AHMUlZl9vYAkUTtJ6KCYD83NSMs7dBsHD/e
         dIG48BV4Ar3PXpoM+YS2BhvwzOa7sVUlRxkUxeCxJBejnQJnVnoiYpuvUb4CYr/inFzd
         IU0Pzp4wPj/RaKDL2MNTGdSIXLdEjP+j4I86cGTYuuJtZYYXfYhTUoNUfPIWfz1nvajA
         g0N7bXabqPNFJ5OhRT1VuYohPXB8aLJHSF1zuT1FUyzxUMyZEjvwXt/ZzNQvhRJHCT/j
         FIrA==
X-Forwarded-Encrypted: i=1; AKwUvBx5BWwt7Kv1g8vBZxaKLHNQi0wyeZAzq3VlymErEIWFvVUgN5C11IDty9LV3rYiROOgy9oqxPGyIg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKtvjdz8Bx/GLUF/3wBHRWdhHIR+Stb43g1qO8RpgIqpasqwLdM
	3+CIfFShVFDF0fZxaFQ2QQCRCrwwtFn2/Tk5i7X/384CVmBWtIS+wAjA
X-Gm-Gg: AYBFou3CJmSS4/vEzcufGjQ7cbSMJ7iSgC17kGd8aLkdNiueRT0opVuT2JAA0O7WX8m
	hBJs6PtMn2ulf3TTJESq6ZuciSi3lfTQtOrTYiJo0IG+hLxViXB72WvX9KATBoEoEQ1R2/kCeQA
	hAqJ/mloZ5VVzJGD38CKQo+n61IcpsrmpIuuwkKyf4v41U/B8Xmra7JPBiYUO+WKlEKuRp1TRqZ
	Zw3kMh3TSuRoMb6E5TNV7K5vwhmX8IUjIihn1jmZ3XGLtUjY9LUOR2THMAukmh4+CpvdC7b+2Ts
	yTY1jMC0DMEkARQ8DHIFiI2Kiv9RHt3RoILbXZVei5UBApB5DoVHwcRtfCDAgbzehQmJqkjzId5
	+l+0GcHkLz1mnyjAW5ljh4noTmbIiFZ1BpOc9t8HPxQCzjpXmpA9dGG0A6pc3kmYt6InqoZwzQc
	R0X3O9LorgZLB1lcooc6POE8HJZPNxgo21d7YnE+hHCVqGs/ZAYCHwGA/vrWvtcLWuhedPpXtnJ
	V+xFHe9Rp+2NZSVUy5I0BJrGfR13YrbVoEAHJEayA==
X-Received: by 2002:a05:600c:3f16:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a18e44395bmr399234465e9.4.1792090595555;
        Thu, 15 Oct 2026 11:56:35 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm106148295e9.11.2026.10.15.11.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:56:32 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 20:56:06 +0200
Subject: [PATCH RFC 2/2] riscv: dts: spacemit: k1-orangepi-rv2: enable GPU
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-orangepi-gpu-v1-2-03566a615660@gmail.com>
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
In-Reply-To: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3

Enable the PowerVR Rogue GPU on the OrangePi RV2 board by setting the
GPU device node status to "okay".

The GPU will use the clock, reset, and power management resources
defined in the k1.dtsi SoC device tree.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index b907a1396b21..cc375dd1a77d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -384,3 +384,7 @@ &sdhci0 {
 	sd-uhs-sdr104;
 	status = "okay";
 };
+
+&gpu {
+	status = "okay";
+};

-- 
2.56.0

