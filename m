Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7852D8DDD
	for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408851; cv=none; b=IcZOJOsxNVAYkdPbuzAMNtWQKtKa2lp+z8z2Opd9BZP/7ZNAFubgFWe8woGDBna3HqDL2cvbDLiHdpp6ecGq58iPmGN2OgLzAw8kpwEZOgMq7gz91yYKDlht9VMkQweQz5gcOh4IBAVKCHgU5tzcmRkybji6CQlOADd3rwAJIzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408851; c=relaxed/simple;
	bh=8O+KmyR+Z+W71V2Q1jG+1NmAb+LSz0CgxIiQwpSEyZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RS8kD0iW4fwk694OJ5oIVFoU/3lzyxBH88lC4kot2WBKXcZD1R+0f+2roF9LkwOHZbwDSuTsxo3BZKD5SN6Ijw/uYqufJlSn70cb6DEkKQwlUPQO9+O2FcNYT7bQH2keNpEAf6ZjeyeSWZq+jqYPTHV3slyJh24j68E6Rw4ADHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dKgsGX1V; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dKgsGX1V"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34c84dc332cso3332367a91.0
        for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 05:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408849; x=1767013649; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0hBCIJJ8EmxKyYJQRfDJ40fTqpg3Aav6dbr97Zk4ps=;
        b=dKgsGX1V6HOew96vNDy4vdJ74C4oR2BJ1nmi/k3rKFwgR3A1mjrVmpJ766liGJpz8E
         +Q0J7yvK9eUifOIioVK4+lX0L5h2XWHADMV+h+vHlvVgLCVyJXiBKuSWZdG20ecvFPBY
         EZJzjb7m6IElU09IUHFpeRWLf9Mfg3B0b60TMfqt2NqTtHMwMXB7+JCIyY5pwc0L8VZf
         v75HtU6Tn+TMMCaNYXGbORXqFIOFSjY8fHJ9hcdswsFNZwLGsTwdreSECP1JOnXtEUEz
         63SrHd/T99jtjEwIk30IVxA4HQg6NQyX688pOb3NsujCNHx+KiPGjvt2n1+rFdcY8vze
         cSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408849; x=1767013649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M0hBCIJJ8EmxKyYJQRfDJ40fTqpg3Aav6dbr97Zk4ps=;
        b=rGQURstBkOlskYko3yqePdOqSORpdUjK1TrFfBaRHRHgDJBAPauiFD0MSrxmTUotAl
         Ypppo8X3DqwUpD3ozKInlVhAY6l5Bo8lCIpXERh2lXgMzX37Ne2Whl9bIWyWTguCKvyh
         WKxI1WQ7DBzCWADuE41MLoFlH5MTE8Sf58mGCv49dbRvT9ZOZMI2VeWuCTIJ+3q8M6d3
         yeeDa26/WhwXy6QtnOftLX6dpuh4ZCZmZNn9typXQF/I66iSIRb0oTFPuYzx+rvCzq53
         FiCVVLpx0IbDk7mK+yTFAi63dMXfhZrIeyYNipQHpRfjC8dh+g0t3KqyUJuIJHjpcnDN
         yM2w==
X-Forwarded-Encrypted: i=1; AJvYcCWxGXvR2+YWroiZ8wWAG74CtHKANqOk9i6G7lisnYN4ZtFbaN+htknrzwALsNWg/cjRd96Nlid8yw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhFcSTrmJcVgVLFEPTRsiRKYganmB8FVYBaC0mv6efPvRvDcty
	E0g/Olt7a5FGA5mxxWDIiIeC0zNjtxSEy2xPu1zcquJHJjGQBZEaocCRKIBAaiOPCP8=
X-Gm-Gg: AY/fxX7s8/yZCShe9G4Sd0K2xpmWtttck4ZUWuFJJM316hmHpdOl+Kd2o3MVChzM5nK
	KqZZlSrsTjF1zduMIFTOZ27ptgw2KR7Ea2lzGCWK4nJ5MppH1gRVOR2sHNeB/eYeT1GlEYotbjG
	d+mbaHmb09BviuFS1CoVvONKxbymvWMnHYIyX77wyCVi4ynPrIMmSbQkLEC0ncl7W98xiRnlybd
	/45MV3gIg3C2Y4wsKGWX2bC6XIvuB05E2c3OqvcoXcRCKkkfchVME8FYorqDGS0SEo/F/02Bsqr
	CN5ieng1HZsA2Vlh3207HBVNOxsBhpZ8n6RQAW+owf6ZzXp0/FU18PSU1gam90hS2k54kEZ/qcM
	kYoM0khkREx3SbTPfzCoRR8s+xg4n0T+TNsu/rdExRT31EIp76WFD5K1JCLri/DWQCgaXv7dTyT
	6v+SwfcLzopl/jmna4WTkQXZfTE97QLhc=
X-Google-Smtp-Source: AGHT+IH/ef6qJxgLISPyQdVV9ykkGamL2Gr7XNJ9wshLQVPd+I8d+rSgyrotTljXgKb8jsc3m2BCnA==
X-Received: by 2002:a17:90b:3f90:b0:340:c261:f9f3 with SMTP id 98e67ed59e1d1-34e92130102mr9913256a91.14.1766408848875;
        Mon, 22 Dec 2025 05:07:28 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:07:28 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:16 +0800
Subject: [PATCH v2 06/13] dt-bindings: riscv: spacemit: add K3 and Pico-ITX
 board bindings
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-k3-basic-dt-v2-6-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
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

