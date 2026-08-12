Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956EA494832
	for <spacemit@lists.linux.dev>; Wed, 12 Aug 2026 23:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577784; cv=none; b=Y3qwVNRnDISx9xRnBdpFJ5jNNjyxBD5kdFwSJLiQNRU/nx0HFGMigAsnTUGRzFGzqG96MTEr4yldCe6Rz/fCa4DZtSP0dU5kjQ3lNWEf0E3mWPG8VH2X3FgMkvYraJWQFN66FmMH0biSmYBqsvtVPEZqb7f3qa+cJN7SFz9vKIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577784; c=relaxed/simple;
	bh=9dW4VaF+cpQj6n2di2ZHB9qHayVfEQpRJEGaM1jJjX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDxhntxSNn4vX9VtCZhRRtMQhB/ojCfb+Doqd8f9MqHgWlQr3EFH2vfWkmF548XIb7VX1XztX6ITMnR/bgRAXShdOQZn6Azz70J4dUVoBuj+98cGKOln0VHch8K3RoKtk0nBQT15wrboDFk0Cv10FOORbHjd7m5t6UkV0I4aCPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FY6MSVFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NSAlhe7s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FY6MSVFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NSAlhe7s"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLQpv668800
	for <spacemit@lists.linux.dev>; Wed, 12 Aug 2026 23:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	chxsFMJd/v7CYPQftCpnnBz6h3uko0w0S390Jkq42v0=; b=FY6MSVFUEMiPzpg2
	OKRL7GB/xap1n4MlUb7m/HmTY4QneQSgQ9aZzpmIEnjOhePICgOQxfTZCYMNb7E5
	IfRRns8mwvp/yNrvCsEczXLTeeu9KI+fgDBAJ3+mgfAjc1UW1zR8fdXPqzuiN9VW
	0rpvQpDd+uTIWso7GidRmSH4PqSlQAlRb9u8RHbgknk8elLYDApRf855F95R4ObX
	qOx78VaMUnets4fiZ1/SS1LINYUuOOs4FdX1NcWxHp2gjEV9c6aYffMR75DUOiGk
	bZsSHpl8i8gsrxTGfWiHM8IrKp9SaoH7wshIWBx4WjNDOZWrFHn0oQZP8hjjDlns
	nVwpvw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0uts1vhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Wed, 12 Aug 2026 23:36:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc86a9ef97so30372855ad.3
        for <spacemit@lists.linux.dev>; Wed, 12 Aug 2026 16:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577780; x=1787182580; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chxsFMJd/v7CYPQftCpnnBz6h3uko0w0S390Jkq42v0=;
        b=NSAlhe7sB4HDlZxRClHSskC9Wac/WzVkb+/rjBpgRKLDy88Wau9v866NgCBFGSYhn5
         NxViGVQzjq0/qund+jcad8anf00EPCPNnKNZopuhsybybKGOKC8ndS9yqRokyTyTvEKz
         0Wp6xP5HOwP8Vyq5n8BtPYdiC9Qk4tegun7CkLQbUENOImHhgTEEZNG41w1q5EflPPLJ
         9BNhpgXA27li9P15v1t052ZecFIWnLpDttCTGe9oSOrLsfKI9EMwbbpo57c367vYqq/k
         NDkL4mnhBmeJk6862PQ1uQDR//OgnfAWgXMpKJ36Cp4BUtDbetS13MWUElQ0yi22nYQC
         D58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577780; x=1787182580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=chxsFMJd/v7CYPQftCpnnBz6h3uko0w0S390Jkq42v0=;
        b=Y4o/ZBDuToj7Or03AcIoeFB6m3O7O/bBSpJO3wibDkTZ6AyxrDnhaShOdvNyYxuDBQ
         Idv/sw3eygW0gkJL+XdfaJOlIGDHaHoy5Im6e8S5Pm2NZjhbaL9Y+C/F7oNtPgAecA0o
         Otap3LKmhw8LZcD2zGmrc8esHOY9teBEx47kcYFJjpE1H3OEbLS9cJOl5alQBCnlmvWj
         dB6p7lxpE8MXo58dFnh9P+us88yFJjh995i3KywruL2Vwlw9W3JshGD4m3Z9JwF1cVP1
         m6PvRFbG4QRDVwS+GWMHw0nOhtP3wb4XShzkT5EhbzS+2MCjoRZ2HhvIEx4zZ+qVjvHt
         K4BQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgnbjTrbvShsjrG5W8li3aJ3LZHPiyT0fHyyJYFQk/eX4pxMlegb14LhV5VjiOwNpjKBd1P7hl+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJgqDVD9NSfiwGtgzPKBsLaYuNxdTkqD6KFwLtbrOgkIzvBY3V
	e1GQQcqgAGnItjDEVL+O+QM0F3Ov9QDjPZLoOB6NuuEb9rfKcrNXAFmEJOEWIOnJYXLJXwRCV4U
	+g9o0svgE2wc/6bbIINhAvolwc9rLgP5H4ohdmG0Tqs2CDXkV8WUMr3vIh+1pVA==
X-Gm-Gg: AR+sD10guD5dnzrxPP1X0GcGiWfaDj/d892YKQbxOByvpL0GR9/yeCY81/xlLnKGnT/
	TeNk0RXLiQLYvVZbuixoycYOJfd09IQ23NxHhCP+QFRywDMYkx0nydnN9yEkbpXBfPVdkwE4109
	3ODj3j+QfkTu2d0gpUnsBfwYFlUyt0o04LD+sc8PsL6MJHoPUqKUh+ntkmcMEjNX3GzEaDR0mVL
	6edNeG8zoLP3PxWRVlA8ZNkYxXagcCx2lALQEO48ozvZp/Oja+oLfyqjGsOVam3xduy2nm94vIs
	TLSsD6DOuWE9OuLFAeq4RL8N/C0nb2nP4E5a5QWr+/htL7/cUKhLxcLMZ7lNPQ==
X-Received: by 2002:a17:902:c412:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2d37d1c1926mr15942355ad.0.1786577779903;
        Wed, 12 Aug 2026 16:36:19 -0700 (PDT)
X-Received: by 2002:a17:902:c412:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2d37d1c1926mr15941865ad.0.1786577779333;
        Wed, 12 Aug 2026 16:36:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:36:18 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:57 -0400
Subject: [PATCH v6 11/11] riscv: hwprobe: Introduce rva23u64 base behavior
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-11-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5002;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=9dW4VaF+cpQj6n2di2ZHB9qHayVfEQpRJEGaM1jJjX0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZrEt9omnjF9tX/pU9lBCyb+leTM4jW+UijyUf866p
 +uu367ujlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZiIXhLD/xqf3ffnKQev/cCa
 KZFhbhhqbvXdVeSqRd3u9qXTT7384cHIMM+gTH/NlW4Gkc/7GZ5eemTyfcbBgk0b73KGBmd2GLL
 9YgcA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: CRCEc65aTLdTkL3-vt6rVsmWw-4pssmK
X-Authority-Analysis: v=2.4 cv=aPDAb79m c=1 sm=1 tr=0 ts=6a7d0374 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=jBCMAwuHs6T3S2td1yAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: CRCEc65aTLdTkL3-vt6rVsmWw-4pssmK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfXw74h4/Z9GGK7
 wfEBC7oxf7mhOUTw7kxrYMSZwHLMv8ioWqBFL+DTXpa38TrqV0AHe6Tiq66TP5SZhgPmPWKe2sx
 oTQeCJ1ci0oImzCr423+S+FsXOjmetY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX+oHtXiETC42y
 l7KdaAA+Sv1hZOHOr75IrZg3Vhtl9UTxO8NciYQi6VJvLpv58D6nXlsr71e/oTU6C1weyJ/1aq+
 VVj+FkJYDyqCVo2/sx6CFVo1oyBItvtheyZqLKFfh4xRtXgB1tzgr2CIdI4fyIOghNRXx1eDESG
 5stKoHA9Kckqwon7B63eV4gZwAx0c9qTRsoc+bH4LEZfN9K2jM0O84kEuE/2vP0P2nf5AWfP4ME
 Mr0xB2w2OU4fJFP6AM8r7henB8FMlXS8pMhrXtbJmznWlA3dDDwmm7gfILhdwjHsCnZ5ffenvJC
 Yg6bMitPw4YY9n/38n6QSIjPXAJiIAVEI+Wr54VKDICe8WPSDoUGUQn4Kqi9rhiVR3qKqg1z6sV
 ipOXjQyOx1YqudbxYa7NLwKsTN42Y3RoxcvJGOEkJ4Ng6CYnz63SQJLppP35qxdoccEm3B3JDRE
 czr5vti8M+XS3p7+89A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190

Provide a hwprobe base-behavior bit so userspace can check RVA23U64
support in one call.  Without it, a consumer needs five hwprobe
calls and four prctl calls, which is error-prone to require of every
caller.  Most software treats RVA23U64 as a new base anyway, so
expose it directly.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: Rebase onto riscv/for-next: define
    RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64 in the _BITULL() style of
    commit 8da45c93dfa9.
v5: No change.
v4: No change.
v3: No change.
v2:
- Detect RVA23U64 by reading from the cached hart_isa[].isa_bases
  bitmap populated by riscv_init_isa_bases() at init time, sharing
  one source of truth with /proc/cpuinfo.
---
 Documentation/arch/riscv/hwprobe.rst               |  8 ++++++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 ++-
 arch/riscv/kernel/sys_hwprobe.c                    | 23 +++++++++++++++-------
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 32a14331eb9d..dc70470093b1 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ The following keys are defined:
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit 0273f3c921b6 ("rva23/rvb23 ratified").
+
+    The RVA23U64 base is based upon the IMA base and therefore IMA extension
+    keys (e.g. :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`:) may be used to probe
+    optional extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9a121ee3b436..4f5d51788c41 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -22,7 +22,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA		_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64	_BITULL(1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		_BITULL(0)
 #define		RISCV_HWPROBE_IMA_C		_BITULL(1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 656cb100ac48..a18465e734b5 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -223,6 +223,17 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 	return (pair.value & ext);
 }
 
+static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
+{
+	int cpu;
+
+	for_each_cpu(cpu, cpus) {
+		if (!test_bit(base, hart_isa[cpu].isa_bases))
+			return false;
+	}
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -305,14 +316,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_MIMPID:
 		hwprobe_arch_id(pair, cpus);
 		break;
-	/*
-	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
-	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
-		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		pair->value = 0;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_IMA))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c04..f8c797b1d0fd 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -105,7 +105,7 @@ int main(int argc, char **argv)
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
-	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+	       (pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA));
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);

-- 
2.43.0

