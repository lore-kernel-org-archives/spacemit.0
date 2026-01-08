Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C893F0742
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 12:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875225; cv=none; b=ta5Q2bZQNXwg6q1WVOPG2VtscenuSrU16q9JPoUNTCJeNUZF8n8E9+/NtIKyRvoe5Y62Zr8+04QUEqd7JpmfV3JCn1chQ4h6awEsdLMcrG88mkAt06K4rbrnSZcd35RYiro3ophP/tU0WkD9giyEKeWXnZXXb0VHPIodRBvlYqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875225; c=relaxed/simple;
	bh=WbzCxbOCk+GG650PaQ0zRwRhYDHUtQ70UFN2MKnozzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F2+z348imaZnyPyL7mU1QYDZQU90isHRKso8/PVED/UIk3AH8Gxok2CDM3bceZ0AFD1JOyPgys4Z5EsnW8OZK1pyZbp486ihlT8Q8AsvEV8Cm/WiLVZoIqDOaiTcr1zZqlTgQT34meWO3yG2Etxm+2gCMLQ0J94qHqYUC9AHVyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=qxDgrNxx; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="qxDgrNxx"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so2251545b3a.1
        for <spacemit@lists.linux.dev>; Thu, 08 Jan 2026 04:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875223; x=1768480023; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1d/sptKjw5iBNotRNV/yKVZGhFT0qCTjPkOa45oLlSI=;
        b=qxDgrNxxXOaLk6sVM8LGROvx9OztB0ttzifop/LPSPFGDqjIZaqBmn7BOJe+/atjR3
         swdntHIuIQwCQn7xsYtqdWiAcpqESjysfXUL/XBYJunvYTBjFKpkKRDE0zDznu5iEHzq
         y0Wv8bQweudZSUinqYTrYPIFYRrLBJ0QGYXbuTEYUmD0Bcqc5JJmfyXrVXW6m4tnN6/g
         keqDJaWYSfEaPdAZOde85mfB1sHS5ncO5Rx+m/qUlwGACElxl/UZhVpHqyydhhiKC1yF
         gBIan4C98h21YzvcaCav8aLjQ14uE6B8Nh2/NmQokVhqavKAalGR57vV8363WztJH43f
         53eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875223; x=1768480023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1d/sptKjw5iBNotRNV/yKVZGhFT0qCTjPkOa45oLlSI=;
        b=p88usYjtLzq/fPLd8ciU8WIuJmiFfgMUu2X5DT56WpKzaUb5FgbHhEqSgE3+8ZN+lw
         dz5MUutjGz5GCm7FQ5ljwrX7TnRKF0iFiOxOTD0lz8Hf8H7TzX8GXbnVaY61e0Igq+7L
         P4qlMvfZiTEKVpQAB1nwPWtutXgxGn0mlaiLjTR5ULxsdIuBApJTYCHAYTC/UhIXgJyh
         uvOT8hi4Ob14aVUj8K91akeXIwp3XdTp9VtY/f2io71V/eJjzya2wrlvBaBGveNNV79/
         bdWvSGcSWwNCPFJws6xicLONflEptNnUOZkMl6/n+3jnq7v1WQNnFmWkCApd5N7+tEdM
         V7/w==
X-Forwarded-Encrypted: i=1; AJvYcCXrbESva3yXryY77PnmHdCtAcVp7pAaKnJ1WVlXubivqpqZPEsBvN4xb2Ggb3NKBN+Xa3l8m0ZXhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTAKonfgfLDTyBO7FfnXolKr/Q+QJj1Jkoy+RLodJGPil2v0S0
	lLXF85L6wGfKQNxibuUGLrnD3RpT4pNuTa5cdWWZ6sTiiiGquT5D3XLA9+DKO03ZjJ0=
X-Gm-Gg: AY/fxX4+G4jgGDe/GRhPJOqf2o4W7EaoCer+npK5QYdaeZtnik2tY2OL3L4CC5JTjFk
	YIBxx9Cn9uMrNXXyzhAbTVCrVcklH/Fji8mUffvNbjJmILtsuU0FeGvbwKZWXIz1u0bBNASvrh6
	QCyYVSnqF7HLw2yQqU/x+I2cxIKrsLeGHpx27wnf9AT9S3uRzQBIjF4oa/oSHF8gLkP+4lSzZ+u
	NZa0KIRTFiHrECFikWsTUXJfXiyDsDraHg3wkj3k+3wfhb9Bw4fQXp3Nw5HlWwSOl3+6EQFFhuG
	PbxkniNciCLzZFqnhM/ivRYvcLoBv4BU0Z3O9zZ4ULQ/GkI8BkdwCX+L84EXSNmRc2oalogTm1C
	vauOEoP1j2s6h7dk+ad7FbSnhboJdyKIhgoM4xC84FXu/QTpAzO1OPKK1vlXkw6woLbKd14gmJu
	2XPXUYt8H6MVDvX2XVZypXw9ignmLbFHk=
X-Google-Smtp-Source: AGHT+IHgvc5T6HyTkZolN8WOySU77yaQYw6IDoxev+S9+8O7C9xiglUnwMN5spw0Ckcph82Zd/Xetw==
X-Received: by 2002:a05:6a00:4503:b0:77f:efd:829b with SMTP id d2e1a72fcca58-81b7ef0b9f2mr5864962b3a.22.1767875223466;
        Thu, 08 Jan 2026 04:27:03 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:27:03 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:25:56 +0800
Subject: [PATCH v3 05/11] dt-bindings: riscv: spacemit: add K3 and Pico-ITX
 board bindings
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-k3-basic-dt-v3-5-ed99eb4c3ad3@riscstar.com>
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
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add DT binding documentation for the SpacemiT K3 SoC and the board Pico-ITX
which is a 2.5-inch single-board computer.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change.
v2: Use one-blank-space between name and email address.
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 9c49482002f768cd0cc59be6db02659a43fa31ce..fe62971c9d1f4a7470eabc0e84e8a747f84baf0d 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -9,6 +9,7 @@ title: SpacemiT SoC-based boards
 maintainers:
   - Yangyu Chen <cyy@cyyself.name>
   - Yixun Lan <dlan@gentoo.org>
+  - Guodong Xu <guodong@riscstar.com>
 
 description:
   SpacemiT SoC-based boards
@@ -26,6 +27,9 @@ properties:
               - xunlong,orangepi-r2s
               - xunlong,orangepi-rv2
           - const: spacemit,k1
+      - items:
+          - const: spacemit,k3-pico-itx
+          - const: spacemit,k3
 
 additionalProperties: true
 

-- 
2.43.0

