Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8D719D081
	for <spacemit@lists.linux.dev>; Wed, 19 Nov 2025 11:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763553198; cv=none; b=tpqWrhgNNyiX3bqXzpY3CiUt1xhFL8CzucuU6m50vu5JmNXgg5dIJjK+4CTkgNVUspJ6+CKEJNVGBXT6k6Z+cEAMNPSUogfTMMLMWOE4CFawhTK+s3sbJT+zY0hfIyOUyVhA/HTnG9xMXTC/XYC9OnQ1xXYoxkrCZbowl1wjIrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763553198; c=relaxed/simple;
	bh=sYgOih9xbGs3F3XHTRJ7fvFo+edeOEgNokHpkprwd2A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QNlsyD1TmZ6Ti8jsTyNGemPqJ4pBQOAY3CgtZGEwE/KRR3NQPYF/Cs28ZmlR+tiqSRetezzswUymlJ9Xf8NEWwM8Cl3EXQaY59wV7toSV6w3q9FCpaI7h8CSr0Fd6rSSMl7GU6/B3XWobdcfxC9Q+GGAQ6IF/RG6t/vcVIu1bqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpDN6Vqn; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpDN6Vqn"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so5408296b3a.3
        for <spacemit@lists.linux.dev>; Wed, 19 Nov 2025 03:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763553196; x=1764157996; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/dJIwW/N0kWg8cOXmaaT2vRpR7NNxpQwJA/W7KyM2QY=;
        b=NpDN6VqnwoESCto9PoEL7OCUpM59M66yzWu2Xn46cQDCT2TWosArWpdz4ioDOBmu32
         4IDBEhxP9I1WWBU9IQpOMcuNpgDiYZ3qqqg1SI3LalMPonxIXTJl976UKPpMYM+KY9s4
         PV8FTMiHCNRWLdlNtyvIQmxliHdLX4b4pIlxa7LwmsvvY3PEi6UOCzFkldgPLoK8bG7k
         lGRIukHWXhV8G+Bqg/m+YB9vEB9WUneSQJ3aqV8HOpD/+AkhS8l2RXJ8XahoH+jYjKV7
         IE8cwpFytFhi02mZwMavlqOJJwYF7MSj7RDleNzqAj+piak8YPpLdCybGT6EeCgfXECH
         HwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553196; x=1764157996;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dJIwW/N0kWg8cOXmaaT2vRpR7NNxpQwJA/W7KyM2QY=;
        b=SCVJawG4CbdhWtzh6USpbNWyx/3vm/8ucFjM0IuyhF1XYNVraBm0SnrM7b/tEeeCMy
         p98LI55LwNq5zEGIeRs8GxOB7yosqlhccUCE49whnJtbv9XvxeDQkiK5pq75rHNus4Xq
         kc7lsja8EIJgEp2dEyul1Bow2oImXd+pshk7gawqiRPTPSV0bwE+yZjTJzUryefdZfdf
         Iyygav7RQKNGFr+8c8ojENcVjOB6NN1um36D2pBLpHFSrK7KR8rHsfWZp4K2VcJ15ups
         bjLhLVBYTshqNnKxvXC3NuRly25PM/7zBSqyo/rdaARJdeZ4UHW5qqJQC8lsi6Y+Mk5v
         XbYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiYBbSpUk3P+P3mOrZCF2MDPSPViROuVOFK0lwQSxrR9TRVdivyQcwBNy12tMvgfA/TsT/3M7sFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyP9l786lqoUghfCUCvrjSuQILETWS8HSwZDxRMrRoRaA2Sop/Y
	mPgff1bvHerfNtI7QDXNPUv1fVKj2WkH2QNCUCwyRdv3AJbnRFt+9bfX
X-Gm-Gg: ASbGncs0mpjUaVItvEvvU1CvUudTwf2INhCFdBKLaT9qWjYQVf9VYQNVsZ9OQu9kelO
	/5yIS50sNNTAPW4ETBxW3DILvRgaSU/bGLNJIPTc7oeI5oYs1PrQk9JxV+GPyFg32SIz5gjdik1
	3e4DiKdpR2srcsKJGpgvwitnLMm7/su3q+tbKk4lrvAKdpYEcOCOT4o7JSiT70nlHMxHHpb3dUF
	3d2ec2LVjSFbCbJoPxXzGRRt/rxIjDgifthORiUJc6/3fmcO9AJQjPNfAlaSGALAR4tWLwlPniA
	i7C1XBw/Hw3vDeA4sQW5MjbvIn8gmJzbSoquIj7nRckL57qcJadkmZ/gIcIpVs+FvzY+b57lljW
	tfzD25REKykmJoep7C+MLuTsfkY2fW8VcfjB7BrE0nllAhiXeZ5b0e7UULTIipb1XOWD+8Dtk66
	xet+zuIOmloqP0UheKVQ==
X-Google-Smtp-Source: AGHT+IEJfBQbQgtvUYdmvQBm2UrCj4dLEyRvU/IrmcWNvI430xMQUCHPm5Ptcge8YsrdP9W2nWxZkA==
X-Received: by 2002:a05:6a20:6a1e:b0:350:b8e:f99b with SMTP id adf61e73a8af0-35ba2195757mr20706141637.45.1763553196212;
        Wed, 19 Nov 2025 03:53:16 -0800 (PST)
Received: from localhost ([2408:8410:7820:651c:873:1d7e:7195:d122])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc377dadbc8sm17903908a12.36.2025.11.19.03.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:53:15 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Subject: [PATCH 0/3] i2c: spacemit: add reset support
Date: Wed, 19 Nov 2025 19:46:42 +0800
Message-Id: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACOuHWkC/x3MXQpAUBBA4a1onk2Zi8hWJPkZTIrbDFKydzeP3
 8M5DxirsEEVPaB8icm+BVAcwbB028woYzC4xOVESYbiBlypVTY+0E7vdz2QXFFmTEU/lSmE1Ct
 Pcv/bunnfD1r01blmAAAA
X-Change-ID: 20251104-i2c-k1_reset-support-12784e17bf83
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763553189; l=680;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=sYgOih9xbGs3F3XHTRJ7fvFo+edeOEgNokHpkprwd2A=;
 b=IU3xRJcKwpUMoWT+rUcpgurcIY0Jzk1f2odi1WOayQ+0gfEARL+PNmM6B8g65taYKt+zhWcGC
 fjXVZc7Ex+oBBt1B5JeclzBIvBPoPI9A4W3sEEPVkZ6EWs87z8jBBGI
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

Add reset control to SpacemiT K1 I2C.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
Encrow Thorne (3):
      dt-bindings: i2c: spacemit: add optional resets
      i2c: k1: add reset support
      riscv: dts: spacemit: add reset property

 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml |  3 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi                       |  2 ++
 drivers/i2c/busses/i2c-k1.c                                | 11 +++++++++++
 3 files changed, 16 insertions(+)
---
base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
change-id: 20251104-i2c-k1_reset-support-12784e17bf83

Best regards,
-- 
Encrow Thorne <jyc0019@gmail.com>

