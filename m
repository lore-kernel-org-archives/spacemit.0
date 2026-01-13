Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECF430BF4E
	for <spacemit@lists.linux.dev>; Tue, 13 Jan 2026 07:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768290382; cv=none; b=lNS7TLnTer0jdSPPYTdTncg3PUUAKqImy90TLAn2x5nY8CtkmMf56ygdemD4imbzNAzwG4tBONMSoA2K0GOAa0cfvEL04v5U0AfYhwz5A8EmFLarzGmvsJbi+HutjFDcERx8Hfx8qIuccReZt/YCDKUdX8+DC8BrtyO14KckrsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768290382; c=relaxed/simple;
	bh=wimpNbGQyk9u8e5Qt5gFXUuJ3GuTlbtVqW9EiDOWvHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1XGB1QiY9qGlwKstTofdimIa2OJehsnKwL0ZaZ9RMZnwyOlPtAwHe75PAqLOTt0LPgM3+c4ImCsFgEG3nxThjVquTeMUEu9cY2BH2U/0m1No9Lek3MaFZmJoWtBFmJ2F/BtC4aeL6Wpb3MWmllqbES3Asp7EZFNpOp3Niob2DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=DM1vLJ0R; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="DM1vLJ0R"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a12ed4d205so46230515ad.0
        for <spacemit@lists.linux.dev>; Mon, 12 Jan 2026 23:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768290379; x=1768895179; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNeknCfa8wEEbV/WEcBxY/dqGiWsyOavd00Bwdi/7Iw=;
        b=DM1vLJ0RsQ1m58KH5Q570UNN49xePEL3fHV5Ih531xg/ToukukrHMt+K8Gp7LH2T4k
         TuEU8BgmayYFWa3rIOcYHGJGxQihqa8nTeIeI6sK5u/3ZWx1mczuFlTjq46VWUIhogXs
         MtRQSMr23sJ+eRcnyv0h+sNXv0X8Xf5EkvHiRDqGRVpk90PEEOGyyQTzuXDFnbaN4iHf
         7wgJFS8IRQZ2r0mmhOEjr39v70EfKojRlpcxuNb15EVfUM/00hKEALRII6MWbuZUOKur
         SPScFGpUEMrIPQDbcAohhx/TAYvH2CvNPFMn8mgXY8ZZ2M6392YLhc5XXWSsbPpyjv1F
         bkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768290379; x=1768895179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fNeknCfa8wEEbV/WEcBxY/dqGiWsyOavd00Bwdi/7Iw=;
        b=fyrrgELYDb0rtT+diVJJMDeEyQRgML1IEe67ZwPtiglc+iBy3KvSlHUae6BNkQJW57
         x9yrhG2Em8kIgc0iIGh2LAtnlOf3bq+k/WhXff1ToY6dI4g8bOosyUfHXVWieAALtL07
         H1zdbF2b3eBs/TXKmIMwfMAWfM32AElOiur5ev7HiVYSOguypwrqhkQM/ny7Nz3SJ+bL
         CkO+9v3HU7Mz0sTqIlAQ396gxEgkOzqfieDZyGHgk+oiOQ7I9bobIW8efSaSYgBOJWa+
         A49mQoi7h9rt4FE+P6PXAJwrj0JYk2oY2J87DIjG3P9Hc0l5+sin031cG2MPv0shz1y6
         lsWw==
X-Forwarded-Encrypted: i=1; AJvYcCU8T5OdLu7fBa7HYZkzMxOmqUmPQtB0XikWC/CgtQf5BLpQq5H94Bxt8ycQTxrBz5ifpaaM924J8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgqTNiA+AD2F2lg+XDGaKKxbjhu6Z/U1XH/Cwd8YBqJMikG1Am
	t1p1KgEtOxbllj3FidnTHAQ6mR9iw5jbYypc+BDyRrz9BOtVQrUpGZlD6qe2IEzelqE=
X-Gm-Gg: AY/fxX4r2KgFiPimnLQ2d5hVtg2tFwjv+O+LOnqsg31/Jn9IFFnvyifsJGYZFLw9K3D
	7J2yy6vXeoAqLn3VgEgHd6SMvAY1b059qMQ8cLOGIIw7DMmQvmk7/PwmgOOTFWL05sOJ3hAjt9E
	GZjR0e+/UZI+2JPat9ne0pSOSuJw893Fotpfq9oFcBfAn2NTPxiii0zLJIIF7Di28x/I4AZwLWx
	wPRcCRbeUCHNYupBnnBIS3p7zXJgEKgw33j/NH0XnskvTX6K2VPl4nKZKzGhOZKKWU1GkeziTU4
	QM3i5qNK+OL5AnxoUn7iynii7QnfMUpGqtzGDS3tiuEjXtZ9/XFgrz0QIuAgkWNEtEfhbT9Tcgr
	nH0TlX7F0rXftqethbY758x9BDjjGtsTDGVEzO5PNMfRYaSUSbXVeedEaLwo6NrUTEZNJBXbd4c
	NciEOTXeICfY7BqSyXf4P8DLLYp5AGRvKGKiuGwVUECPaykR+p7mZQPpWJFySuneWs
X-Google-Smtp-Source: AGHT+IGrssuTQycrsW+2hCknhmQdMnpg0esEoKPvLFi/81f/ttHiYeTe2gILmVWkDFy41Vy2Qxe06w==
X-Received: by 2002:a17:902:f547:b0:295:8a21:155a with SMTP id d9443c01a7336-2a3ee48ff6cmr185468915ad.35.1768290378939;
        Mon, 12 Jan 2026 23:46:18 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4bd8sm190956165ad.102.2026.01.12.23.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 23:46:18 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 13 Jan 2026 15:45:53 +0800
Subject: [PATCH 1/2] Documentation: riscv: uabi: Clarify ISA spec version
 for canonical order
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-adding-b-dtsi-v1-1-22d6e55d19df@riscstar.com>
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
In-Reply-To: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
Unprivileged Architecture. The chapter numbering differs across
specification versions - for example, in version 20250508, the ISA
Extension Naming Conventions is chapter 36, not chapter 27.

Historical versions of the RISC-V specification can be found via Link [1].

Link: https://riscv.org/specifications/ratified/ [1]
Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/arch/riscv/uabi.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/uabi.rst b/Documentation/arch/riscv/uabi.rst
index 243e40062e34ed5057e3e79ad61311f94b7dd404..0c5299e007622a123d64cfd36ac1491b22d4255b 100644
--- a/Documentation/arch/riscv/uabi.rst
+++ b/Documentation/arch/riscv/uabi.rst
@@ -7,7 +7,9 @@ ISA string ordering in /proc/cpuinfo
 ------------------------------------
 
 The canonical order of ISA extension names in the ISA string is defined in
-chapter 27 of the unprivileged specification.
+Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
+(Document Version 20191213).
+
 The specification uses vague wording, such as should, when it comes to ordering,
 so for our purposes the following rules apply:
 

-- 
2.43.0

