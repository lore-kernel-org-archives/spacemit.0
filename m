Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229A13CDBD7
	for <spacemit@lists.linux.dev>; Tue,  2 Jun 2026 23:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780441991; cv=none; b=XFFU4Zcn4bQg3Ls7ta3EAVDyOOzwunv+lRpOjpEdk7MVomDgOl20/Rm+vkstjJF0Dr9XoMfG+l/crXXLb6ZRq4pckzSNtyukxSufEs78OSh5OCWrQIwVRhX9+t7dqQ/dlyKumlkeCcU2jr6NeymDucGYPYo+xfwmOsya00wcwow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780441991; c=relaxed/simple;
	bh=rqTVVVJCoPVd96u+yhPMJffItnZ+P3H94JKRDHrTXaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lr8HKhQSO2RRpi6RNvkIGPsP/5ivWZCSA+AcllzxwrtfYw4o7dQh/Y0L30VmfkEp8Lzu0A9glKnMDIokY6mLMN5//ogYIUmT+E5YwSACnhK216GplYroH6yP18Kf3GuKbbVfjLJFI+B1Qa/qczO/3tbTGJV70+HksrJgfygLPT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/O1zW/1; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/O1zW/1"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf36a6905cso26396105ad.3
        for <spacemit@lists.linux.dev>; Tue, 02 Jun 2026 16:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780441989; x=1781046789; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHFIY+oFxYCby8roDhyuYsQin7Ul79zLqHihVHlWSyo=;
        b=I/O1zW/1hMqwB5fXUT5B8aRswWq2Mdcys6nZwEZDWicpLOhD+40Ax3c4/ljI1go8H1
         nJrsOyX1eE+3dTiV7js7lYlQ3BosyPeOdjNtytYALq5NBcM1rAbrmMWGxyL9XjrU1Oqu
         6WkYlJiAu1/5h+jp0qMV0cJ4MsHXh7eOwqYBVtw1IT51SjDngtQAW9TOJSmvbpm5Zad5
         WT7wx+OZQlfmFFcJv2rNwtWph2+00Zpf1RSq8ShG8U6bph3KwwGXzXcg0MjYCzuUwSTG
         KD9GdrkhrB8O53FQr3Kq9+Fdjb11DMQmAvXMZCneRl2nucHr84Fzr0TWGXmfk9sa+eOr
         nqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780441989; x=1781046789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hHFIY+oFxYCby8roDhyuYsQin7Ul79zLqHihVHlWSyo=;
        b=cBASEguEweYyPwRAXCc5ZzhDvKLVkBxUgEwMw/8xXaH3U2K6PNlH1Z5IBtq/LrNriu
         C+5wCAgZczaTPLvOTAMKoU9Ynh6qekcHNjIIbxlHLq4fN/ZHje2Z3foJ2Waabj3ZUxNu
         Nl/RHlmVkceFOQMWMaH3xydqdkHDSG9WkbDVykEvGwBGIT+NNSngifWvWoOQl7O9Bciw
         Dn/O0lW+No+TBzVnD2FVaNZjEwKZux/JRe4o2cM4SmfRaA/aWMjITXU/E6ydNro4tzzq
         9i1kA4jb64dyDu8E0ZOAqqvtvs/BiIM1w6B51750z0NVA3AZtkM5kBU5o+Pc1AHtPVYt
         sEAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8apJWPHX0ewU6I6oVIRqzn83Hd5Ey8y9GLmN+tWVoKcsae+jDI6BfjfyLY+tSXGhWlIOgE9hrgdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeS2V0pIco4KvLb7HeQsxPN6+QnhNQqxFJhbbrn1Ovq+RtScPQ
	2R0UMqA05ZM/SpHAPB9BaRaSTTHevAVE9wkV/D13AwTOKhTvqyaiDKnj
X-Gm-Gg: Acq92OEy6Elw2DD6t6PwuC0xbVRbQDYn4YnzEUuJ6ERNCHjSmP14lTVRkLvEgwmYJTW
	RIqXav4L2+XvOfaU66jSByBqdT/c7lP38ekw6k/Ns1KCPxUf+Wyq9gTxvqk3xhG8iWB18brk736
	8vL+djbgjpGxK6D+PS/yydosMHmcyM4cF2toKfouQ6vklttVLOCOPms+T3OH5q9djHS5S1C+zl3
	/cqa7hwXGTpedUCF0mVE5hxF7qpkzMcpNY79t23dGMTmAlI+Y03uxiv8vNL7R1vrshze8gnLr+i
	fhEE7fRoVLvC5A0IE9gisLQrv5dTaskrug6EiQj4tD2wN7d3ok5FGWdc8nL3YhKr/L0lWcZ4JWC
	jZqyLz4sI7oNlPs8pN9v+jgGd+HP0OmrOKE0GQpLKHe2IDVhtbt/fy4BRQ75mZH1rDlfde5ASzA
	n+C0iRegdPICTk7549HvZd
X-Received: by 2002:a17:902:c950:b0:2bf:3074:34dc with SMTP id d9443c01a7336-2c163a59aa1mr7469645ad.14.1780441989552;
        Tue, 02 Jun 2026 16:13:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:13:09 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:11:57 -0400
Subject: [PATCH v3 02/15] riscv: hwprobe.rst: Document EXT_ZICFISS and
 EXT_ZICFILP
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-2-5529a7b28384@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=rqTVVVJCoPVd96u+yhPMJffItnZ+P3H94JKRDHrTXaQ=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHmbj4O13uthymy6JvU+rEL4dKfZMr+tUpU9DpyHf0
 ydWIhM6SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCI1PQx/eHnlc18+d3FcUZbm
 v82hY/8q8W0sHw4vvh+j1hzCevjDDkaG66/Wxs9YyBsrs37Fy717DyUeav92P6Wk2bE7UWuB6nZ
 dLgA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Commit 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss
enumeration in hwprobe") added RISCV_HWPROBE_EXT_ZICFISS and
RISCV_HWPROBE_EXT_ZICFILP, but did not add matching entries to
Documentation/arch/riscv/hwprobe.rst.  Add them now.

Fixes: 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss enumeration in hwprobe")
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3:
- Also document RISCV_HWPROBE_EXT_ZICFILP (bit 63 of IMA_EXT_0), the
  sibling enumeration added by the same commit (Andrew).
v2: New patch.
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index a09a8f16bd16f..3cedaaa53f331 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -289,6 +289,11 @@ The following keys are defined:
     defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
     load/store pair for RV32 with the main manual") of the riscv-isa-manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICFILP`: The Zicfilp extension is supported,
+    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
+    extensions specification, ratified in commit ff03d8485a04 ("Update to
+    ratified state") of riscv-cfi.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
   :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
   mistakenly classified as a bitmask rather than a value.
@@ -391,3 +396,8 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   extensions that are compatible with the
   :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICFISS`: The Zicfiss extension is supported,
+    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
+    extensions specification, ratified in commit ff03d8485a04 ("Update to
+    ratified state") of riscv-cfi.

-- 
2.43.0

