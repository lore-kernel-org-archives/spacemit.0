Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3C3BE542
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 13:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892033; cv=none; b=G2yZUbETLVwhABuGdgZqOdW8ZVw/670wVdAsY2oDNkZ89e7cGnnUGemZYJtSTmY1hXigJLE1Sab8Qa8t+NFdUVjAvoZ9d/yHhxc7QwRFE2eiz4nKefn6cds9AAiDuXAHLNkDMfGanbI9TlcbmpK+cib9OlALr78CiDu769sapvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892033; c=relaxed/simple;
	bh=Zbrgxl7/8K5204RAl20OAm5sZDIuaXEuvin7xFtImFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QCRZrXGP070neHcSl3qWLJxRJPA10K7Th5FU0e7/gIIpjLxfj3i/DmfjPe4gYgKb8Z+ebGKgoakDObFTERzcc98i5se/NJqr5//JEq0Roq+klwWVes8jN8sAcD/qMerVXpoxWxTSmVWVYxksh7aN3vRoLDPUpoDlf++GEJJa7Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=XZSyn5+6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="XZSyn5+6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0d52768ccso28558755ad.1
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 05:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765892029; x=1766496829; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+gFWCwRiawMnBncXcTO/PvxprCNgSOeAOdslKE2EFs=;
        b=XZSyn5+6G7VVnXBuwXhnmXDgLBWVlQ3Wf9Y/Mw/4fmT++DWeU1pi2h2g+1Q9Vv8hJL
         1yTgpslszlzxT9ZkZ394SEfqYea04ajRdwjiG/zeaXPlxp0gI4M3lWfkf0ENBk/PhQSH
         vVOvoxiuL4QjkRZHUDgV/DvSNdW8+COLd0t05bO5BEniEpZyhhhuegVBH6y5bqC1CLPo
         tYuZvDF+4K5RAGlxY0WFSCiQByUVeo0E1e1hPSkgi7CQThTC8m0bt+DTFzuiutdfQXtw
         Uc4Ng2eaRiP/LSrl5iA/DIpB2/YRrQ6r+M4NLQYtSJdDucHMGiIBxkJpgeX4CGwltmfo
         kgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892029; x=1766496829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L+gFWCwRiawMnBncXcTO/PvxprCNgSOeAOdslKE2EFs=;
        b=hex7ui/eOXb22NrZy72tjUK68jEKs/TZtFReETgwqT9deTGB42rMCzmZ5A0aq6Q3aX
         sD7BED2J92Ls9L8rtTqVD8sJkpyHMjMZ3j5+On6twGXJCT2Rydog5w/cJY/45gjBRg5M
         PODZ9sVoBS6mgZieOWHQkV1YNMCSpPV+WvPZiFbdHanQdXQdtvdorpL7A0XN4gsQctBW
         8mSrxCbR6iDmBPXTP0rYHj29g6wYaIlHzggrXrl0PP90hsc0SUYKWEO/Zaz8OdUnQbWt
         DiuL25xjglIDbwH34F9XXRPHFSp4BTaok/Jv+y2rKSHd6ZNc8c7mcs7rHQUDssABIjCN
         qRuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCaghBNnC+xxFNlEQlpIQUQZaeIQaPpviiVFJ2NtFc4L5mrjTyqCxSK2aJslvSfNCW+eWkvu1rLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAszqMQbgNuSf4m+QwGPUOL2sp3JLZ3bmUxKY96oxJVujJXwrb
	sJsB36fZjIT6Ju4U7AAXOMxe5gqj3rKWwn+jnMxZOmxaUii2UVPcdsyGuTPMNhaJYEY=
X-Gm-Gg: AY/fxX763sG9BQt/CyOQjGGQD1yP06if9pUQm5zETPrn49ric8ewuvKw+ZV6+VyXROV
	2pd7ktgfOWEKMNChYsV0wfssM894nSqGX8qrMpDAeKD0WpIKWFNnvOsYdJL30b3BACSrCW1S+jg
	b6f61nx3DnP4mJMw4vC3COi1wGEj1aM1Wrp8Og5qntoKHTILh2xHOcIHcYB2k8aOZxB+MIdQ2Y8
	zPzxPm21Yq9i/scikkE51rI43wRn86tvIqQd8sBlfbBC5I2CWG9Ga7tS+DGUqv2sMJFzAWk+L+k
	Sv6T5rnLOmARWftZECNJmdvNIsCCaru1Yjuh/mWRURj1+uC3A3HJG4ZvyfPfEqVOziiCzvxNw1d
	x9Nc7Vcd/cxEZE1NUJvqnDzRlu0ZtLS9WxwMxug6irVwwqCq8u++2kIHXdTyE6xi2eOocMnr658
	CzD72enM9OnTtVk/Ux1mGOalU9A+mG9lU=
X-Google-Smtp-Source: AGHT+IH555BYg0W02DfoN/1AYodPyeJqWymKTxAH7DEgGh7AGGSGr1M1vruhKc7CF1NGnjMT2M0bUg==
X-Received: by 2002:a17:903:48b:b0:297:d697:41e with SMTP id d9443c01a7336-29f241515b7mr111102665ad.37.1765892028806;
        Tue, 16 Dec 2025 05:33:48 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:33:48 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 21:32:29 +0800
Subject: [PATCH 5/8] dt-bindings: serial: 8250: add SpacemiT K3 UART
 compatible
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-k3-basic-dt-v1-5-a0d256c9dc92@riscstar.com>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
In-Reply-To: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

The SpacemiT K3 UART controller is compatible with the Intel XScale UART.
Add K3 UART binding and allow describing it with a fixed clock-frequency
for now.

The clocks and clock-names properties will be made mandatory in a future
patch, once the K3 clock driver and device tree are merged.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 167ddcbd880058b6dcea9ce33bd814ff8ba6b0f6..73851f19330d7f9fc254efcd32b5977feada0b07 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -160,6 +160,7 @@ properties:
           - enum:
               - mrvl,mmp-uart
               - spacemit,k1-uart
+              - spacemit,k3-uart
           - const: intel,xscale-uart
       - items:
           - enum:

-- 
2.43.0

