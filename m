Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B81B36826E
	for <spacemit@lists.linux.dev>; Thu, 11 Jun 2026 20:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208829; cv=none; b=U2Iaf6y3EyccKzs3mFNxkl06V5GZiTR83rxlpCHupDFo0dbqFKhU2ApWeGl1/P4y7uCEYDEKvNe+ZTL7nntZff/3KgnA7/UpPzgSFuvIwuXRQKCsCZ7iaBJ9g8OwPYOb/HmJ1LD207oeN6fTRtKd65VK2jNgDGuTJ6VlbbX+28o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208829; c=relaxed/simple;
	bh=NbZKfIhAESQSZGLKBeiejMf182pR47BEC4U9FBjuJWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tbc+CcSaBQteuCXbReMyJGNqGRySb8EOcEVk1+jLfenM3nXpXGPa63hcOx5sdd0fDW/ShJTiovQBo4OAqXsEINXTO1wNrw/Fdh276S4VycFWHgSy+rYoFaF6jTKsmufJXfngj8remMS7XsWvdqPMw1NKRcUSPK/cCakYwbJcDEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtPNmhmy; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtPNmhmy"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so1874155ad.1
        for <spacemit@lists.linux.dev>; Thu, 11 Jun 2026 13:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208826; x=1781813626; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZxM0nq9Qo37aSql2ij+ibdvlWTuLmx0z98uOay5MXI=;
        b=OtPNmhmy1fNclCD4IDkhA8prHl8AaD+ZaX7BZnuqUHZTWHa3U1n/CqG/Pl0eF6cq2f
         JaoirdINWw1VhSFm75uhIBmcWQm23TFYuz+ywx493/STLw3so525zv5obheXDO+f/10w
         UxK4MNdO7IhGcXJLHbThBix+qLsst/3jZW99C/7KwguniEl++whKgzLPZD49YJnq3zTO
         NfJv4YRi7bLsLYTWNQnrdnK+OvFtOSsfW5KcUE0AzkJzDPZz/l05ilqIQVCaHTJCjCct
         YdrZaOwakbcb1MZ1WvMV89U2CFg9i1xYKH0OlEGygAnAWNoQG+52atZ2VmspA2IfZZNu
         ligw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208826; x=1781813626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SZxM0nq9Qo37aSql2ij+ibdvlWTuLmx0z98uOay5MXI=;
        b=S9hjYDRL9WvQPyxXVAmKHfcZeHgg9tV2x8if8X1hWeks8bmM7PPFtIeI1I6CVbneyG
         lmuPnu4nIZY8JqSbkH/x9C2aGhwqHkjIPWKd0Y4do2XeHEtPJiRSifrIL5GhaugceHAn
         vbsP7k9aPBBioq3vt/H7DRAFWKMTkexfq5YLETNLv9BGrw0dFf+hbBRixzRX6LxbvZlX
         yKzdTCrgpwdIcItGvm/LJmEY/k3aETvVIohgY5n48tyn6zzzyCJD7GyP1EKupQMyS6Ki
         Gvy+zfJvjI4O7FrnfR+v5Tbyo9Aq37/bQd6wxgkTVK5l6fpx01SIieR6L1uKBIk2KJQV
         V6yQ==
X-Forwarded-Encrypted: i=1; AFNElJ9I3pG0V1wT1Hj7EETL+cGkMnNHN1mJ2DObQmvdeVJIM8w/fssDEoDlBouShlne3J5nFyy1NpnNJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YywD8SQpsu1xEmtv+0u+x3Oc463Dv3TyJirPjqAI1jUHJC2NIbp
	r0TlH67Q49RTJASxaUkoBYHaPUdK83eVSnPhuLtBRBmhwjVfHLGIUnZ6
X-Gm-Gg: Acq92OEGdJi701dmQUYsd1EHnOGMdTZr8Rtud9hnspaztNRqclyAjhEAHUhcffb5owG
	GukJ6wmYfv9T2NLg74TheAFi4OokQ0XYu3z5Qg3ltXIUz0cT3gOa12LoSvBS0zKARLtg+OyYj74
	t8KdpEJrfEiwj+j21MvrelLruPT6r0hz0cgHMwOuexanmqWlQsbPGqMiMhz7LdWn6wLpERPJza4
	4/QkoJxiYbV/Erdu+A5xpJ8mkgAlidn3icoRQ4oIwe4tn+gtWDnKwLftpKdeYJ5c1UgX/qAqiqH
	6pXcen48ePBsKiJPNywZpwQpPSZMSgkoZocaZu4VVJEntv4aJ+Jxvni0BaZ2EkhEwFdom5H0ixi
	v7XRQUfD1NPDKut311ggbG5ahYcDIusH27yJQBT/xs0tHjjkZxOMSkO5CDLeNem9ve3aLRxetTg
	==
X-Received: by 2002:a17:902:f60c:b0:2c2:7baf:139f with SMTP id d9443c01a7336-2c2f2693495mr50380055ad.30.1781208826458;
        Thu, 11 Jun 2026 13:13:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:13:46 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:42 -0400
Subject: [PATCH v4 05/16] riscv: Add Zicclsm to cpufeature and hwprobe
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-5-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>, Jesse Taube <jesse@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Andy Chiu <andybnac@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4415; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=5gK/AJ7I7Z0fBTNqkcRMKGgIqY4cXewYPVL687SON2g=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsQNLEkV1ZpjuVfdXemZh73iycw/Dg4u5M1YkfLdJW
 stekszdUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABM5+ZThn9Lc/lJlgV/G6qEu
 nGtbnFuuTzxYpV1zqGBWnqLL5KDMHwz/PR+Yh9lkftX7wVj0+dsrd/ENPUr/WiXcdKTYX/RVm5u
 wAgA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

From: Jesse Taube <jesse@rivosinc.com>

Zicclsm requires misaligned support for all regular load and store
instructions, both scalar and vector, but not AMOs or other
specialized forms of memory access, to main memory regions with both
the cacheability and coherence PMAs, as defined in the profiles spec.
Even though mandated, misaligned loads and stores might execute
extremely slowly. Standard software distributions should assume their
existence only for correctness, not for performance.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
[Rebased, rewrote doc text, minor commit message revisions]
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>

---
v4: No change.
v3:
- Move the hwprobe.rst entry to the IMA_EXT_1 section so its
  documentation matches the IMA_EXT_1 bit it was allocated in v2
  (Sashiko, agreed by Andrew).
v2:
- Rebased onto v7.1-rc2; moved ZICCLSM to IMA_EXT_1 and
  allocated a new bit for it
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 5 files changed, 8 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index d9928641deb99..49d9fb68632d0 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -401,3 +401,7 @@ The following keys are defined:
     as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
     extensions specification, ratified in commit 302a2d45c243
     ("Update build-pdf.yml") of riscv-cfi.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 44bf8c7d8acc5..e8f4a7dd96a93 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -112,6 +112,7 @@
 #define RISCV_ISA_EXT_ZCLSD		103
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
+#define RISCV_ISA_EXT_ZICCLSM		106
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9139edba0aecb..6819df159c51e 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -116,6 +116,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
+#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 1)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 686dde3ce3b98..1fb595581adcf 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -502,6 +502,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
 					  riscv_cfilp_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index f8f68ba781b45..9cf62266f1890 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -205,6 +205,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 * in the hart_isa bitmap, are made.
 		 */
 		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

