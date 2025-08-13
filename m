Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10F22F0C68
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 09:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077018; cv=none; b=ePhlYA0u3hNqjH04p/MwSMEyJrsFWZghLXo22CNJc4v4WJ/02+gf1fUjrX4lrYaC8dRiw+m543YsV+yJcrRq6fsAH0hlS4KkiYsQJVNk4sDc1sQGMwzso8seE9m4tObYadFniWcNsA0/8ezF11trww6CcdSzcQKPvpy/pHMYQHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077018; c=relaxed/simple;
	bh=/rTdKk2uoMxb+q/0DRtX1FS+dFKCBJFEKFc1tSBa6tI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AhkS0uZusirIufwCp8hZXFgB66yAP1HEWC4c4RR7BIdLjyxqOd//FKDtZLP/WcbUdl5DJ3c8vdEFZ3G+5ZEMXNfKkbr2KaZL8G5jNqDJFMjuAp0OoROdVhCueK7nkL7YWFiVxMZaMYz4b4t2c+pTldv25AhcPoYREia1VvIVszk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=XtgjwjlE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="XtgjwjlE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-458baf449cbso61667985e9.0
        for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 02:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755077015; x=1755681815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KV/LyU13FVZD+Ygh9a2dJ4SQHfL+zi8sFF76wcqrPxw=;
        b=XtgjwjlEm6+CJDQjV54f9iaWPFpad9V7utMJCe92bqePNhwkEURHeVJS0YmDE9tfr+
         bC+tn9jvP82nFwvceXSqlFvRf4mZ4bAehyjzEwwE4A/XD6rxWKqBxf6+vmEq3h7w/daz
         ZgnHaFY5rNSVLOJook8RVrhbws6dcdna+zylFunTwnswS5dPKbUQMOTPoWG/bFgW5XmE
         qjkm2G47jZCMX4Fb4Wl7nqoUY8HKhpnwZ5pobH9QxtXxa2vdErolmZsmnfLb2gm4E4QR
         AHDdxINF0U53DL/CkD8ix043verX4eQJoHJ2DDMMeLx4xaDjQ6J/ep4sO/MOepNyjPi/
         CHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755077015; x=1755681815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KV/LyU13FVZD+Ygh9a2dJ4SQHfL+zi8sFF76wcqrPxw=;
        b=dO385A1F10U5bH9MUwI0PYJNcPxVyMz0+kxnjBsHO3DaItzssEva2wCDBfJRbJTeeR
         MWkI4hypywmBS3PQoa8lbsJhkzKlC3LKIquMU3OYFAbUTXTSIrwWRSkUNUgaTTIio5br
         W0F3Glv4gbBk0M/wQsKk/iRrAMupPxStXZgUusACZU1Nnl6PlvWdyr9j6Yosr1IvYazD
         XZz8LzjUcvIt0RCX/N+vf3x+GsQgyohhMKhYzaAoJCc+0YrBVwwP9OZt7rHnSqt1L6KG
         fk4U9ZbiJvc9FwV8tf+O/NtWo4AdCxpEWITZVw7xkAQWVgpmuP/zSRq1IjfnF5q9qVwl
         vtkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKrNHxo5P4mp6rIt0280YtWprPi5OXg8Wp8ZHkTR2h3kObR158Izc/WeSNhYe4E/DiGWTx/c1/Xw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzX9CvvU7JeV5xYhROlHu9/GH/g6Lvq2IywZwZ8yCE0cg4Hb0f
	djHWmeFUJCfl6MD5QpWKhEcudcUWmQXrG3wyUrr9gY7qKjE1T+eOl2M3zg2HFTFtAx8=
X-Gm-Gg: ASbGncsg90QuUEhkfVtkmidv0Eh+0dG4i4pgiYcPhToN29ohtmi6FCH3yfrqmQchvKq
	6T+693VmS2/km4DDjqst6LyO6ipYxCfl2zAguu0HSWoapi6vhGVx3JbvJwMwarolaga9N1l26lM
	cWsY2QB4khYITVf8KzLHhCUcVrJ/m0mrGtS63eoePhKjtnt5MNa5fiV8QExJUcSZvN0fPCcTzBP
	x+OspQQb04H7cRwjOmToYyDyoKDkgKShBi8Cbb3A00mIa025izfetEXAal5xMKJEApKMHyVRdse
	6are4sprch5i8JsPdX/rbPKklgW2ppzOf7p4mw3QczPIF+0q6UyVurpoRG7mmvURFF/SdYCxaFN
	3bRJqtxLikpbDkB6osxXxwC78pRzofHRO+nEQbzdz6BEt1PgrKw==
X-Google-Smtp-Source: AGHT+IEWxoI/kRzm9XJtVKTQJfagZa2jXeR/JqY3ScAS+RcLcnu42mBz4ZP0ExrShNWcggbJ1f56TQ==
X-Received: by 2002:a05:600c:4e15:b0:456:1923:7549 with SMTP id 5b1f17b1804b1-45a16b73703mr16081835e9.26.1755077015065;
        Wed, 13 Aug 2025 02:23:35 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:d33c:e682:2af6:3c3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac158sm47966077f8f.4.2025.08.13.02.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 02:23:34 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v3 1/2] dt-bindings: riscv: spacemit: Add OrangePi RV2 board
Date: Wed, 13 Aug 2025 11:22:39 +0200
Message-ID: <20250813092240.180333-2-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
References: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible string for the OrangePi RV2 board [1]. The board
is described as using the Ky X1 SoC, which, based on available downstream
sources and testing, appears to be identical or very closely related to
the SpacemiT K1 SoC [2].

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v3: Improved changelog
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 077b94f10dca..c56b62a6299a 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - bananapi,bpi-f3
               - milkv,jupiter
+              - xunlong,orangepi-rv2
           - const: spacemit,k1
 
 additionalProperties: true
-- 
2.43.0

