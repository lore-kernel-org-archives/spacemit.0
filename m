Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F9138757B
	for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 23:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768432759; cv=none; b=LpZ+U5MNw1rvppkV8MrHFrMyzIHj+5qGO9BC/AntMZaILN8HrWhSSmcSFhqPE0oNbhJiVwck3e3S72HufBtCEVYgDNJinKmmYhG/c2f1EB76zXERPv5/2V4y2w6iWIxrI2ndCvfGXxZsM2jPuF2CSYd5NSuhTyRzLsylL4MwbiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768432759; c=relaxed/simple;
	bh=Z0/JjbecIj4mMFn/eww29bfEtMYsLkii0TunPLdkuaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JG5T6L8WsR5w4gKS//xRYytxxVjeBO8QFl2iNpfYx5FuDnSj7toG6Ql1Ll8aBEPtd+SDxwe4ht2UgQm6m6ghaafS7csEBqYaWlWYYzADDuMm32M13z6bYZ2D3P4sI4trmF6mN4uvjlN0Q4S0WQyF0rGfTHyB4RVZbYusgkWNIoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hW9PbQBv; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hW9PbQBv"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a0a95200e8so2407635ad.0
        for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 15:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768432756; x=1769037556; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nbmp2d0HgOyIl8jX1BIaQZ3qrfCn/EZHa3mK+NXd3sU=;
        b=hW9PbQBvSFFtQawDXSq2MtD59e8QqGE3WhNGJsF9c9OMdQktxKCSCi87QsaRfFWX2I
         feljrrR0c0W8lCWePpWr8aFKTAdi7KS2X4TJeW90CWQv12kMkn/oK2Wu3xJCB70XDGS+
         NDLY5aKz6QW6UDRJ0cqaY9I3PkkZsMLhkU+IKEU9KBoYS9YSprgaIMlKVsanaRV2LDKi
         MkHV/O+xTTjg3+DM4ngVU3jyyN0qGBcYc+VUZArGSWn+lGTa4Aa6uzG4QS2m8/qac/6c
         Mefw0k4V5pNplNyKUnOK5Q6z6Z8PXft9Flmg7Anc1Tdi+rGrDL3Tut6iqwQ+pAysXE8E
         gcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768432756; x=1769037556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nbmp2d0HgOyIl8jX1BIaQZ3qrfCn/EZHa3mK+NXd3sU=;
        b=tKVJz7ygsNjXmD9VX86MDjMAE4a+6idLmUg8lslg2qR0L+6kZvD15ugFlQqJViDY7r
         5SjmYlCDxxmljtKWFaiEcoqWhErLHv6VbofkYo776P3Nr+zYDK/sCcbAnS7JnHmAROyo
         3JzAHJUiONr36cj2JbqyAao9ZNkZ1jVlXiwpTF51lbymeEEIrkyFqMC9eDORJkyYOJ3T
         IZb4EkwxJ6SyPvm5kztncAT7rUzDE+LvTBKBdy96R77//fuQHjPQEpqZaZ0sZoBmwDEN
         dBgRk2O3b7jV+ZrpS6/k+EFqjzb3B8RkBe97Qo7YteadMa/I2728K85eFTEv65g04e+b
         4D1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfH7X2KqN0GMfWOigC8BKDpKIJy65j9XbQRxzg+VWnLyKmoa3/jEAF7DuxYEGSGREncAO4yZFTcg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYMKNKGvkKm1mFsp7eYV0gbAIkVX32AhEP2wclDUhBjZrcHULw
	dYyUoDL6Vn4aB8DUmHkSjxos8ClhT2tRBBOLFYL0xJimtdRVRxkTCTqW8KfCkZ9nxD8=
X-Gm-Gg: AY/fxX5I4KF1CAXm+trh+n6uDOO7GdtoZ/9SeATBOeEJykG+erCxpLMJE7Y5qmOiUn+
	WmRLewb1yys2btKs940XV0YkOfPF5ad+xPL79bqx+uA4wqsVihK8+1RD4dFJdIHHm9rFzqXViEf
	rEDPCrQwTmfbqQrf0rEsyfUR06jSUOkLSRsqyz8qL6IfSD9sV3+pSOE+qWBFyjzBBAF5iHtqgDs
	6+d7NRjz2DVv+uu66/eaetJDjZ33xg0hAKz6BdaC2zDb/4mnD+IeYQnbIs1vCsVpNfDdli6EpE9
	ZGiniLp1eK83Gtz0d2KjRFKwz5ojmtDN2S//DroF+KQQD3eGffQvCva+uPV3itMT3vLaQZm0nHy
	8oSOq40p1qz8YWOkY0lllNtP2F8wpcSXG45/xVifggF56VTtfRgxazMlFdJJsVMkvL/+eqMKRYK
	lMFhfIp/GO2AacnMq/cbcNlSP6BgW+ApevV5ZJdG+rjKAtFE0eRNzCqc+UuJk2V5IY
X-Received: by 2002:a17:903:3bad:b0:295:3584:1bbd with SMTP id d9443c01a7336-2a599e8edb4mr40339635ad.41.1768432756448;
        Wed, 14 Jan 2026 15:19:16 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d6csm238591755ad.64.2026.01.14.15.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 15:19:16 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 07:18:57 +0800
Subject: [PATCH v2 1/4] Documentation: riscv: uabi: Clarify ISA spec
 version for canonical order
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-adding-b-dtsi-v2-1-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
Unprivileged Architecture. The chapter numbering differs across
specification versions - for example, in version 20250508, the ISA
Extension Naming Conventions is chapter 36, not chapter 27.

Historical versions of the RISC-V specification can be found via Link [1].

Acked-by: Paul Walmsley <pjw@kernel.org>
Link: https://riscv.org/specifications/ratified/ [1]
Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Add Acked-by from Paul.
---
 Documentation/arch/riscv/uabi.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/uabi.rst b/Documentation/arch/riscv/uabi.rst
index 243e40062e34..0c5299e00762 100644
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

