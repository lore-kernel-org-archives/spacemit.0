Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977933D1CCD
	for <spacemit@lists.linux.dev>; Tue,  2 Jun 2026 23:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442102; cv=none; b=DJKH6+zFT7QjRCZS8gLfrLXzDW4HAQrz350G0Uo5ZnkWkzzlYKHnYLxE+CDwGIVJrCiGNM8XqqFQQv0jQrDjl5gwRcSn0tE/x2YbY0coylJflF6p46UmqxnH2ajpsANyDVzxFycufPJlaleXonhhzZgxpw1yQ2SJbLI0r9V6SFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442102; c=relaxed/simple;
	bh=tvhH0zhqIk8afs9rDuWoi/YmPHardg/YTAjvWDHKFDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gv/FB3wjQMA+9mOHxRQBqwtQJXreZlhWx+mWvo2PyEjL9EJrKJjzcvqEO6mUrU3ii05ci5YLvlKcCIbV3n6kJdGUColsU8H7RA33XNGI+j5qPK4rfUKiV6YHlEXaowJe6Ostw3ipaLTl52uyJhC/0/3N7jh3kMuxLyYEwsc1zic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxPljGAH; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxPljGAH"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36baec934b6so40607a91.0
        for <spacemit@lists.linux.dev>; Tue, 02 Jun 2026 16:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442100; x=1781046900; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7boHfA/wFrzsz1sM7I2UAXGjLvkEYWGhZgOkDT/r/jQ=;
        b=BxPljGAHXL2sTfE0coxSYyvPtG9mv/NyDpLcOm2ffdWuymzJBQrC0O+XNKo334F8Fk
         470dqRvwUmijFR8OSJKVx0QE8Ei0qwZtS3X7YqMfNOCAWkKrOh4JVxlVyuMLJpNiqrcb
         Y/Qr4ehVc8H/p0Bku29cOdmRYD2QGYPmE7L4F+zMK1cYxw53Q92qZHh3nP+5Vp+Jwjuu
         zJuo61t7VWJL4H+Fi55ZpTcYht1KovtBo4Cwrub6lhkdCFc/S7qBbEeZ8zwOt49GyFHG
         3f8NKUCoZoaPa7jfXqSvN8vx/NohiwT3PqjfE5XnZunnbl1qWVRQg3sxfyE5Mp4WGW9a
         UZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442100; x=1781046900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7boHfA/wFrzsz1sM7I2UAXGjLvkEYWGhZgOkDT/r/jQ=;
        b=F9eBSREQRZdnlTHnEMJJ6cCdu0Vr04fPhY/2CrSvrOo9u4dp8M5w8fZ3eKmzaWLsrb
         0THcXEsAK8rfk2zPHKnYrd0QsDmhM6qiapWWNfakKy3GmhPAi3dVMA8kFrUW8vt2oIYY
         JcVibPOmJPzGUpwQqwWqXwnw/jwerxzB6KuySrhBqNeLFsuHTwgXZv2BVAIeyKnbXj8i
         9NDtJBWB7hWr+0N6O4ylxK3l+ye2TYlBRxDTJNounnrm588njI1AkTE5OBmZkFUlSh+O
         Cy9v/g8UeT9GMNcDE+yyAS+JaKBIocyTOp0ESOZffJk4zNZIUdRHSVmQypzGKRow4k92
         lyHA==
X-Forwarded-Encrypted: i=1; AFNElJ8yNG/K6wYkvtJPa5vTj1oWABwwvfii3n459d9ziUHKO/2E9HDBNfALbkfR6lB3VrIEmmW0UD8nBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWYV2L23ee3bwLpP6C9x0sIjdQwNGOG/7k7yZOqasQ+KlPYm9s
	4lFBt/c6ysLmxWhuFGCSG8N1SAB9VedsBjJkEP/a68JiJrF1ira6jsyz
X-Gm-Gg: Acq92OEgcli1MgXCYA6kpWDQV3j/R8GwMLA6O3aSVjURu3gWJOktUzzlgQghCWPDaLT
	sKPYDQaGVfs+pfyCo8ciDOwRfHLx5fAWbhqsoI7ErjMg/WnfaIwBOyLqmMaIWXVHttUEKZbBh7+
	HOGGkBt2aLm1D1sy+N/Gb1C+4JxOu0pb5FVFqTY0MOo5c/59MhhPtBONSISOnQiUW4+0Y0xagvv
	8Tt0ht410BTK6Sb9nhdUxm7k03aCuyTh8Prl5lWCMg+rWpZapv8i6scmsaaHizsskLL7jnegjxg
	wghsw2IF6+MPERA45i8N9K9NGD/w8MCh88pJILxLM4q/BtGKPzTLG6Wxv8DKk56914i5i8+NL7f
	a2IUwEHtmBwgQzSFDfgAGhPeyqAVSzGl8jUNGmXRq40g9GAmt6SdPkDf9W4ze1jW4opwJB5wTq1
	jjHzlZye/weg==
X-Received: by 2002:a17:903:37ce:b0:2c0:d29b:34ff with SMTP id d9443c01a7336-2c1646eaeacmr5471065ad.10.1780442099816;
        Tue, 02 Jun 2026 16:14:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:14:59 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:07 -0400
Subject: [PATCH v3 12/15] riscv: Add a getter for user PMLEN support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-12-5529a7b28384@gmail.com>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charles Jenkins <thecharlesjenkins@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1911; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=EL8rlxjtR8czox+vDhBwL1idMRjEpfUrJqNmOC0hv58=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHrZY9+q9B3v8ZK6p7otLtTvI4VC+6oT7t0uLhDc13
 /XllYvtKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgIm4SzEyzDZ3u9ASoOlvfSuw
 pOCJRaxy6cHlb+Zqq85+p/fB6qJvGyPD/E0qV+YFOtwqmPx9rvh/8bKo3NgHqXcrN6WX3/cPMJn
 PCwA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Querying whether a given user PMLEN is supported is needed for
RVA23U64 base detection from outside arch/riscv/kernel/process.c.
Add riscv_have_user_pmlen() to expose this.

Link: https://lore.kernel.org/linux-riscv/rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53/
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: replace exported booleans with getter per Andrew's suggestion]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3: No change.
v2: Add a getter for user PMLEN.
---
 arch/riscv/include/asm/processor.h |  4 ++++
 arch/riscv/kernel/process.c        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 812517b2cec13..febf51e127f70 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -214,6 +214,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
 long get_tagged_addr_ctrl(struct task_struct *task);
 #define SET_TAGGED_ADDR_CTRL(arg)	set_tagged_addr_ctrl(current, arg)
 #define GET_TAGGED_ADDR_CTRL()		get_tagged_addr_ctrl(current)
+
+bool riscv_have_user_pmlen(u8 len);
+#else
+static inline bool riscv_have_user_pmlen(u8 len) { return false; }
 #endif
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a5..5d9cb108a6232 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -302,6 +302,18 @@ enum {
 static bool have_user_pmlen_7;
 static bool have_user_pmlen_16;
 
+bool riscv_have_user_pmlen(u8 len)
+{
+	switch (len) {
+	case PMLEN_7:
+		return have_user_pmlen_7;
+	case PMLEN_16:
+		return have_user_pmlen_16;
+	default:
+		return false;
+	}
+}
+
 /*
  * Control the relaxed ABI allowing tagged user addresses into the kernel.
  */

-- 
2.43.0

