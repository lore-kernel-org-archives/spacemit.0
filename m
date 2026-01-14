Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADABE38A716
	for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 23:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768432771; cv=none; b=RhbtGUUP7nrEyDdCdICSLyTuJ/jM4lVh73yGxiCTyzcXoiRRPgzf+p2F6OPBjON0L5ZeilHVQHTAXmGjWELmo68Iyyo5tyJ0+CBaJsBH7Z8MlSx2ixmUtdB/4Dz7HkXX3Ec62q13Ztrnqex3K70AUYY7kiq/X+W9zi9HorHPv3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768432771; c=relaxed/simple;
	bh=g9R/DgoDWl6EF5D3q8DzkV6XBEbhurMxaGpLqhJaO2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PhrbVFTyljRHhYA7jtRF/7pJ9wcX7jF9HONmn/FBXNX8YHjCg6zTdZjloIDGHibCMHO5X8gZPOZAhHPXQzJZETOYvuFWe9otz5gRbT4E++6CE+iSTRHIEnlZ5Aw22YwSuaNrOU+TtOZzTU7eANff0drVh8DlolZK2ARTt0vxcIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rrclge9o; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rrclge9o"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0d5c365ceso2542595ad.3
        for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 15:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768432763; x=1769037563; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaSWKwxLaghni7N9hjcOEG+LzgsthN0XWKW1He+SYHg=;
        b=rrclge9onnzxKF0Jum1/o5BGxdCPhIgEGNRcIrbAy8PwE1N4rwCkIobOhRAgFyaJdy
         gl38S40TP4XGEZSycyQDcZpAJk7Gfr6lOV2j3N7HowjyS8lNUC8dBkH+FPZGBgD5ATeu
         MSDjP7AN/v9919oKmA3fCwGj0YpNDuyhwYreDyl1uUScV2wj9MEKaqEHB2s4mvHS2Umq
         kklPeoos4AD2lO+OkBOwQESVGSbZl+NbybWtoK45MdfMCWwtAy+AQ5K6UV2fS94xnBqV
         +bUh7gxQI+E+1/AOhP3Tjkfz6FMIP36wy/BWqqWkwCsWaU7GqX4+a0L97AHEEI1PyRL2
         gxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768432763; x=1769037563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kaSWKwxLaghni7N9hjcOEG+LzgsthN0XWKW1He+SYHg=;
        b=Op6W6Pbs5LDYLsgx1sojmOSwKHWvVT9jf+n+wuwn3HahLoraN9tbH1ggnW8PH36mCq
         m+KGtu3smqk3P1wm/2pA/FCqu/ZNTpw0s2mc5e/hX58pIGZf0uyfJSQqk/nQQzeiVI6n
         jh1aqEzJhe2gsLXetRA/Vrpjn0k+4VtlAl83Re4J7RKf+WObsHRfyH24ADpB5n518ZDq
         bvDICxsXWBfi4bSDN2qtAtrC7tuiyJHc8uLjqj8oqL8pUcmag6LDIDsiS9duVkW0CdS5
         gkpzYECWnxSVmB+J7ZKr6kGg8v3WzDa+RI3hk2aR74oJmzYQlXPBGQOPrsK0beh0ECQO
         b4Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUy23Ngf6klBVm5Pmwx9/HbnH5lP0RggSwAmI4vZHe8duBfbas5Wr0EZ3grbZJlMZH9Kyog+8Nryw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWNPs75dJ3p8l2naR3CNAIymrjUVyIsrP0ybzjtUXxV3PgZRA/
	D0GS6wZBx+pxEwpTlGMnnn4k4ocXGA38r/A9AyWh1/RPQwLwx9BSmqQsMlQSjfJpANU=
X-Gm-Gg: AY/fxX7q/Dg+EsCcPofB9Xkc13SCuHTfZMMvzaYxgahG+mzp7uXSH+NKuf6CQJlQSua
	xyB8vQXK94rPQpOjETq8CaRVKyJ9MjCnV9P2+8BW8cbe+IQ6TPgpqxN15lSo252UdcdPfJ/s4mo
	MpgPhp78ghTJFt3rQqRJTEHUwroohst1AlQ9kztJAwuqdXfd7NZG6P/4ES4JumyT8gv4M8FEV50
	5vRK9bofBqlBJzcZ6/bk5v2q0dy7FjTXpRLXowY9UVWQIJnsBhXSyLsoTocXyECGQ6xSP7ZTi59
	pETcx9aXRngJKfVBygTc3w7aJ+7IcuJVkeF12jH0t25q6f0o3OMAqZIOkYGJ8/3jJgkLFpKLros
	MOI/lci7wdYN0ftWmrOSlqYtbaFjhaBJs2LRpHMArn1o/ODUUMc8NcS4BBZsw4hpvg0B9f1pOue
	uSEIxwam9ki5KWINphFQYGdAtnbBcW2vpTL6+mEVuD1Wlobt+kjhKS/w==
X-Received: by 2002:a17:902:fc8e:b0:297:f09a:51cd with SMTP id d9443c01a7336-2a599daf6afmr44260145ad.14.1768432762876;
        Wed, 14 Jan 2026 15:19:22 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d6csm238591755ad.64.2026.01.14.15.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 15:19:22 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 07:18:58 +0800
Subject: [PATCH v2 2/4] riscv: dts: anlogic: dr1v90: Add "b" ISA extension
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-adding-b-dtsi-v2-2-254dd61cf947@riscstar.com>
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

"b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
(Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
checking rule is now enforced, which requires that when zba, zbb, and zbs
are all specified, "b" must be added as well. Failing to do this will
cause dtbs_check schema check warnings.

According to uabi.rst, as a single-letter extension, "b" should be added
after "c" in canonical order.

Update dr1v90.dtsi to conform to this rule. Line balancing is performed
to improve readability.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: New patch, a split from the Patch 2 in v1. This patch is for
    Anlogic dr1v90.
---
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
index a5d0765ade32..9fe183f5f5c8 100644
--- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
+++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
@@ -27,8 +27,9 @@ cpu@0 {
 			mmu-type = "riscv,sv39";
 			reg = <0>;
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zbc",
-					       "zbkc", "zbs", "zicntr", "zicsr", "zifencei",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b",
+					       "zba", "zbb", "zbc", "zbkc", "zbs",
+					       "zicntr", "zicsr", "zifencei",
 					       "zihintpause", "zihpm";
 
 			cpu0_intc: interrupt-controller {

-- 
2.43.0

