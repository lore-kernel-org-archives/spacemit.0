Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B4D48A2BA
	for <spacemit@lists.linux.dev>; Wed,  1 Jul 2026 12:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910440; cv=none; b=mufSCyius8Oi+qvCrG+NnPBmRAlVHlPxKS0/qTcP0XXU7ANgYKXs8YvwkVdV0Av6Sk3c72dL5sYa6+1kL8x4IJmFx9sDhLDqFYSbQ87Svv/Nh3mh0X5cnWc7V8xjuoEg76wS8eLP4+IxeYgjMjCBi8YXjMCsrw8jRIj/hic8FCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910440; c=relaxed/simple;
	bh=qUpQI6roeceadtMZx+l2gkdH7v1ZAYzyOmrKiTnQRwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9SBKWGP3hQK07hRqDbNXC9TolgPajy8q+60Sq3gmHFrhqnngVzMAyAMmDeqlTKF8O+6RRvCldEZWsNPjlG8fGMQrC4AUCMZwmm9dJ8+U198ped01F1aF+pFreb8Tqx9p87z/F1VE1IqcbtYzVC6HFJevChnCrBcpF/zcb1muqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G21mey/m; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G21mey/m"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c969ad04c1dso182119a12.0
        for <spacemit@lists.linux.dev>; Wed, 01 Jul 2026 05:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910438; x=1783515238; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cf4ggToYkrlCapEBsvBHakBfX1zXebmGeq/ps06lv7Y=;
        b=G21mey/mX+F5/z0eh3uqDI/tHz0vMTCHIyBl2KFe2F+qm2U5IqPGQfo7kRVdFpHlW+
         OzNboFIliyfz9JFpmJf9OLAHq4zd25uSIt7GoTqeLhltN018SaGiFKq+9Jv8vmvRZxn5
         k1IMLtpysosYWhBI3jCi6KeEDEH9o3WqS7cDL0i7fEBgV5z+HvwRmiungyf5ug2r5Bfd
         VyWw20de1bDPrZFwMHaGfqnhBhpQXqMKck3gyURt1DHb7c1SPxqWPFtmiIF1Kyts2f03
         QQM+KmiyfuKYDUJ05eJeX2P+nUuBIoLHnl201P0aVkLR0mCZh1vSK7QkuDt/wdKykA3q
         +pCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910438; x=1783515238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cf4ggToYkrlCapEBsvBHakBfX1zXebmGeq/ps06lv7Y=;
        b=q0ZCedM8G82GmeSll19VFbe0jeUasaOy+DmkPH5CEd+fyMAZ2ZY6bwJt3hXAfWyzE0
         s+8SOdUcfwnmD+Nb3h6Nb+CKGoWxl2b3pKOYDDKRGIqjSsY/Bc6BPt0gICoCUS4mYkE+
         UTT/inPGu/519vI1+ytDcLQaf14ROQ3zLN4sUPWooO2mICJTaJ3fjBaGGOHWrSdWMSod
         JC4ha7PBAc8tfdfC/UigXNJeMx7OD4JPewy6TNTop28/P7MU4rKToffL1gVbeG2YIwb5
         0xzml9jSOWXpkuRGEZ3gHhfI4Q69pmdQqA/P0xGYsZY5UPFf+PwXUvlhjwjNGSoBlI8i
         5vpA==
X-Forwarded-Encrypted: i=1; AFNElJ/pLgLLzO2ZzV/19z3xi936Ua8WGdyb7/oDdJjGv0hR1MeNr8p5HgUwjQn0cs5EREYTjXrwsWhwDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YweXHivKkO1SXpfuipZS8/axYy18rT4l/2aiReYZxERKWsuPYhD
	KZXD2D4UvPVci03XjBxtiMz/UQFyUPtNEccYwd2e9dOwH26k4ODozrdq
X-Gm-Gg: AfdE7cnWLoHlO0Uk6yETEtpQS873JFniSvMyAr/MIBKXpMUseTt74j4wbUe8NHTFIyJ
	yjBTxOgD+raywP3OLcAWNVpsF7W8cTLKD3NYBQs8t7ly+jueCyuLZNpPUWV+LrLzLMyKFjwWOOs
	d/KkO/WOhckzxQt8UWEY23ed6MEv7jixyuKc4XK02gCpy/6xUYscFZicPaxMfSSz/i3GmlLbAzV
	ol1xWPkV50gNfcw8d+ZfOM9lD5ZOFiqCIeUOWZF7PQG8tbkBeBPpb3AdE67h6P5nuQkzzHY1pow
	UjApzc4ibVz36iqUNACHu60BCG4FTpALU5ayttnswKBHYXGcVKzT24CE7XPJgfCIQVtR801nXAt
	FdHVJjkV4ei5c7tfNA/hNGl6021bVbg2Gl9bljS4pe85oCod4HlmQr/05ieNl+hvRa1FzpAShXL
	Vt4RY7a0TfjcvdU0Xyn2WN
X-Received: by 2002:a05:6a00:1807:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-847c07c470bmr1460384b3a.26.1782910438134;
        Wed, 01 Jul 2026 05:53:58 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:53:57 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:21 -0400
Subject: [PATCH v5 08/17] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-8-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=qUpQI6roeceadtMZx+l2gkdH7v1ZAYzyOmrKiTnQRwE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3tZJ0Su79v3RdX58lNmxpiXmJtcKlQyZK/LSqzvea
 TYzF0p2lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwEQkuxkZOua7fZ3pvVejxeEy
 +4eeNdKc7+brz377VsVu1amK7kMbXjH8007YqzrX6+sFsXM73URmzGLLvRK68UNyxWSL+++Ufmz
 W4wEA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Zicbom, Zicbop, and Zicboz have no default cache block size, so a
devicetree that declares one must also provide the matching
riscv,cbom/cbop/cboz-block-size property. Make it required so a
missing block-size property can be caught by dtbs_check.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c02..f4dd34d446c02 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -1142,6 +1142,32 @@ allOf:
           not:
             contains:
               const: zilsd
+  # All three Zicbo* extensions require their block size property as there's no
+  # default.
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbom
+    then:
+      required:
+        - riscv,cbom-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbop
+    then:
+      required:
+        - riscv,cbop-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicboz
+    then:
+      required:
+        - riscv,cboz-block-size
 
 additionalProperties: true
 ...

-- 
2.43.0

