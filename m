Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F344DF3AE
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875193; cv=none; b=Hbc0UP74avRSJHBj02t3t5Dtvil5R3Y3x+zR6x6VrG5PUHnKhV6i2YTScEBqLmQP+oTTk9f/txEGaH5peEYP5TcjmTdtmvf0Aji22Nyh/Vb0kQsS7E/FT6oIkB8FLMaVvnGKXg8gq9UFW/MUPVAmbbTFRfgdzc5NRBKDEguT6eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875193; c=relaxed/simple;
	bh=jwDsgL7x7nOIt2v7JDXtla8T7Jp+LG2ZQ5oLy5SV1cE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LIaDeV5kkAkne9fY0u47Rn9c/q113AOvQHRhqA4k+6IJ9dtp+l59wvAsT8xtYjVueFTPRq3rgKuH/xv0rJYZWucN0+us7rJ9lnXHC5Mu9QfwykOu728/rfLsB5KI3eAPtZUPK/KRKNKN3KomhPbD1r37A5T6l9XCu2oprYKuLHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=GStZ5TSW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="GStZ5TSW"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so2065711b3a.1
        for <spacemit@lists.linux.dev>; Thu, 08 Jan 2026 04:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875191; x=1768479991; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rdFmdZfR4eNmRMqejKMXyCR2tEpYJOIzk9O2le0lBU=;
        b=GStZ5TSWhMadO7+CO1A3jJfAJXBSopaNNwCDTGeI/hPZbM7sSsw6jLwgxRk2j3Alhf
         f/QcXP8/UET4659FVXUut/gzddeLF/S6YOxvKox0yT/n2ly3AxJrvVmNLI0YwVlQL151
         iscHFvGGx5PxDpx1MUYLVFEfZbTbBGTsWniIA4CpCjCE2IcVTTo4l0z7D+BxNEwvjP0+
         PeXaTLZCbp30VR3UWLs4aB9O4XKniMk10P3anSKSfBzWDk7a1w7+qjhLduIGdy145mHZ
         +OLOUFNSgiWzLg+rhFs1U9kOCLtKZzjMhVdFZ6kZVlHaBGMoTBOc5n1vFR9ipM1O0Jpg
         xiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875191; x=1768479991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4rdFmdZfR4eNmRMqejKMXyCR2tEpYJOIzk9O2le0lBU=;
        b=VNPUD2wf58oVNtEYMhv+v0I39flIupv0PRgLFt/YjzFJ89GH0ZRVCq/Cd1+d1pMQEq
         APWpvHQrW45uzl2xN4N5gxrv++bxuttgWwJQTmd3nAIN7D/JNdfr6M2q/ANZ+RRCo/MP
         3nrbcJZpMIj0R0HQyVgLnXMJli5lWldExZDhc5+olXmRu7ElgkfLXuZhda4h680H8V5E
         S/FUizciFg/s13PNpDXOJhRovFFSOlOXAHbli4QVOWWWr5Lbbj1iUMQ/NGs1vlYEXltd
         tccBgEf1OwdyHSSUuIrcFnb6usAme18vFWDeb36T/vv2AcYD9Di7X+vucpKgjO6H1l8Z
         mjTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGCd6M9aHgRJFqlCEAA+jFcgtQw5LlILRFpt/QFCLyKheI/duKwwY8Eu/3ckqolK1SaxIpASQsxA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi9oKdbd+ufsuzdbUTPFgnR3bZOwoG9kIkJFGssX8v8WbjwDzX
	FC4R9Xqlg01oYyoyJYh8Y2l7LlM2j6QRPxfDUfWweEPiiECfqlc01SMDYt6qBLLDT1Y=
X-Gm-Gg: AY/fxX79R4aq1cIB9ZCU7ChjUvX5/fKC610UxNK4JYK19NWv/OIeGaAPcJbm5GKx+LY
	owQ7lGRas2dt7J8iiVSjGCBIsKqJiA09djnsdNOHa7oX6Nl8nqCHiRIW9VINiGmZcNyyPKyEW89
	k/UqxzOKFB0h95DUUHmOSTNAIJXJyzZqe+NJwZCHux4ctyqPtPalbnqeWf18YqrDr76CHSQ24QD
	z/oL4b6dG0H01GmIFJ5TZcOr61XSo7hLQO9va+J0jteIduauYqXEQhnaKM2b2+EOasbmSsjP0b2
	XpWX9yhooBXXjibFm0/up2VUgBIQ8d7Gxq9CKMyanHE46BIWlG590AmqaBGxpZv+WRh8A/y9kYi
	94YOgJZsOcu4SXTGEF2V9MmxBj+oYrtbg34Faa/Bc1qboLnLjL7sYFfAfnhxiBvOKUMqD8+tekR
	/JynjTQEYYHDZPMExf7z9+PzLWUnNLPhU=
X-Google-Smtp-Source: AGHT+IHheKi+WINIX/sN2F5BrXIlf0KDIJbSmAHkyxZzFI0+gQsjVJ9XwXI3CiyqReN01P5B6clk5g==
X-Received: by 2002:a05:6a00:440a:b0:819:4284:365b with SMTP id d2e1a72fcca58-81b7d95f67emr5827148b3a.7.1767875191060;
        Thu, 08 Jan 2026 04:26:31 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:26:30 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:25:53 +0800
Subject: [PATCH v3 02/11] dt-bindings: timer: add SpacemiT K3 CLINT
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-k3-basic-dt-v3-2-ed99eb4c3ad3@riscstar.com>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
In-Reply-To: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2

Add compatible string for SpacemiT K3 CLINT.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change.
v2: Add Conor's Acked-by.
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 0d3b8dc362ba7e8d0ca6d0cea692ceddc5e1f89e..3bab40500df9bc2ba4f7d6f1bf340c8cbc06f9de 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -33,6 +33,7 @@ properties:
               - eswin,eic7700-clint     # ESWIN EIC7700
               - sifive,fu540-c000-clint # SiFive FU540
               - spacemit,k1-clint       # SpacemiT K1
+              - spacemit,k3-clint       # SpacemiT K3
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100

-- 
2.43.0

