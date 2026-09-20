Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B473F3DDDDE
	for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888814; cv=none; b=E/pjIUCoVtZHBFMu2QYFZgdXfUfmc3n7jBTEskEM1UBXwQwok+vgvoLOED3k3mYl3KvoUtUPQ80CpXBqcFcqcO/r5M9x/NBS9T4aDDmdYKulIObsGaWY3vBp/bugB5SX2O+7ArMeCKbOvAc2Okvs7iGhwOf8xB5uNdm8MiF9PlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888814; c=relaxed/simple;
	bh=YgS/IB4s8WPaIOMiZ6JH29qlGPXEFMhKzue+pmpKLGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SkOf8mcaqBWqSLh+ITp6BLtu7+Pl++fm09jTa0pCEtQXIlb2JMxidATR8b4f8VtniW8rCIoS/9kLDH15VJtfELH2mmZoOxsHuLa9IXBMbldPpMrKA38qDlh9cdXwOA4MW4m59fU3mAFTdx5GEzRPKwP8GwvhBxeEC7JgjVJK1Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QrWy3Jbx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UXOkHbIt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QrWy3Jbx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UXOkHbIt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55AwF1610146
	for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 07:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HsgA0tk3dRgdOjoRTGQ8Mt9RLPyoih0R+wzz46tu9l8=; b=QrWy3Jbxa/9A9xki
	0xtBBUiAf6w1VFoyAQVQZFTg9AgaKDYZ6MkMaieHlPUVSvmbTct1oLK09R385Or4
	jGLNR070jFWIVQWBojRKsLTaSC8MfpPPqLv7BB04SlKtGylLWCdvrXbfEI4gqCg0
	E4iwc2SppLmWuLcPypBmIg4TpSprjr6rf1qzORywuoGNlIg+pG8vOLAR2J68Isqc
	ZUkVl3sjbnJ+TIaQ7K+Q6uyx367+lPS/OH/s2/A+Pf+AbT2CB5fGrnSFwOFMAEHG
	esWIA3vN6P4uKYS2BFLw5bI2CVZoI3/X7AI+O/bKnLczk2CtNlXp0cOgMGhusHse
	syj1cA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjm32fps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 07:20:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6fb956002so28733865ad.1
        for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 00:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888811; x=1790493611; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsgA0tk3dRgdOjoRTGQ8Mt9RLPyoih0R+wzz46tu9l8=;
        b=UXOkHbItMn7FVvF57d0zzLp/8kwwN7Ry7Dz2UPa59tgbWBuW1SI7LmJMPlHktuLFIZ
         ffg6WgmP86vqBDaxp7W9YQu2X1h9WOnVO7phzIzv0vE9c53dCgPOysxlQo6kRfwvpLix
         v2/POk3h9h7Dzqv0NMUxes7GfckptPip9bbr3H4eDdOQS8A+9JNxjsgduSJNwbGiQp5z
         cdUsDFlF6U3fm3JOhfCHL15X/E4Nx32WtTtigKujW4NR9BdwY6RmlbO3h6qqKP+gJBV0
         14D7f/971aGecOx4YFu2P+PF9vXMNYgGOWyigyJV6aAXLXwevPnT8d2LwLNFVixmVU0e
         oX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888811; x=1790493611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsgA0tk3dRgdOjoRTGQ8Mt9RLPyoih0R+wzz46tu9l8=;
        b=lPqz/Y947cYsu9d9r9C2VAyvgrUlR33yaxOYzrmI6apwbs+fR02qvathP6g9EZEIHV
         QVZF2iPdyCiWBsPhElSA8v3SaCBtH2gPmGax5JKDT1anecskIdGYUcwxV53hdBHNZCch
         IYbJjO2mKZNwQtbqatnZKpa70kwqu0eUhgiuGx8hKa4v03ElskqAUFBMUj/aAgOa72qM
         46E24bKG6Oz+nP08ABlTm68IZY4S9lXxcrnVF3NUprjeY94YcdtP1zo3D6GM/lz/2CFY
         oWCJrE9LGVbT52VW39ma0Bsz9tbgUpKJy5C5nsoD4IGEjR8cFZ4sb++4RiODpxluprfe
         5nEA==
X-Forwarded-Encrypted: i=1; AKwUvBzdFW7N2wRUxI9hboWHvk4YR4tT/lcs4wqPuyvofgWMCW6E7TrDnixN/2S6x/xg6nzm26vROiCLIw==@lists.linux.dev
X-Gm-Message-State: AFuF++l4Hg5QLFXIweSR0SPWOANAEuY67RBOQoAcGEsoKWTcFjTABQsV
	IVXgPWqfpKODlFzaNTsLAY00kM3yh6rafGFhcyA1Icp2k9UIpSaqM0laJObGlayRHqbvWCFOQsT
	lLXCf553Zknnq47bzBwRJ2/RiKYh2NzeYkWlcINeXzhX+V7gCIpaIlTV9c23oSQ==
X-Gm-Gg: AYBFou1GdlsmNYY/47LRhOTkCKWMIUFPVNxJkugCgNUcMBwtYNc2Qlgs52e3cS29s5b
	NiZ9GpgyGVg3aSjjnCkzf/DrIPrPfc4d4IVrKbCzjMRyO7GG2p+2QYBYo2lG9hiA26/EsuHt7o1
	SSky4sBRXeVYzLiMC0vNDt3CKOSaqh1JX/ghnkikpTut5gZIHLtb7Sq2vjmPRvbcChW+z+5oxqR
	rbTeWtNPXtkrme44RW3Eyj4yC9ixOfFiFJ3i8MBUQV/NDimn7lVM6jWcOGRrwsc2MOoVCy/B3GP
	TR0wzurfvFAu4N1j/KT01JHJqUGhE+jjq4uZsZV8vXIGyQkyWbWDXNruNTA=
X-Received: by 2002:a17:903:b47:b0:2dd:c053:d740 with SMTP id d9443c01a7336-2ddc053d7a9mr61039825ad.39.1789888811064;
        Sun, 20 Sep 2026 00:20:11 -0700 (PDT)
X-Received: by 2002:a17:903:b47:b0:2dd:c053:d740 with SMTP id d9443c01a7336-2ddc053d7a9mr61039295ad.39.1789888810468;
        Sun, 20 Sep 2026 00:20:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:20:09 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:31 -0400
Subject: [PATCH v8 11/11] riscv: hwprobe: Introduce rva23u64 base behavior
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-11-5f14bc5c23d3@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5683;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=YgS/IB4s8WPaIOMiZ6JH29qlGPXEFMhKzue+pmpKLGc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1Hacz970yXrFEP7L8taGpf8LFybPPm9XXZ+lYu5/OV
 50hqfmvo5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACay+QojwxZex7L/k6u7WXpq
 3u9ROaKy+f+009EZ30737pmuvejg436G/1mq58UvJL1MiZqk/F7spLXDpnwNvhkfKv35/6ke2l7
 kxwYA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: 1rmk7iGpzJdVHEGdqlQS1SXGVD3t8-6v
X-Proofpoint-GUID: 1rmk7iGpzJdVHEGdqlQS1SXGVD3t8-6v
X-Authority-Analysis: v=2.4 cv=DtfDa2/+ c=1 sm=1 tr=0 ts=6aaf892b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=npia3EAcFH_frxJIFygA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX7H9k20xPhZMZ
 cMg9KhuPYnDY3JNE7On4Vn5GaGKygFIyaWi1qq+9AHseITwNp9ScJkWZfgtgvhQ7ddYAnMX9LSX
 bFKQaxYU8ouoLWYjvX+qY5iWg0WsE0HAWMrfRKvvCRwdB91bShY5fMfS5x2sjScuM4Dt2DsN/Ie
 BkhHQD5d7h0U2J7ah/94CBRR8A39+8nSlSBCNs1s4ehAgQW2gDuuPbH4VOlW3aX+rIiwqQd9IV4
 NNu2SblctnxID+l5s0mWwZTvTwHjGwIhCkOV3rzy5xkFPdElTUOvMwOFXsU4U+sOCM9jG/jlc3C
 sl1Z4aPvJrAUkiRkvAPS6YOHZca3w8aJZNGH357EbWeaHLNsyaoV1bMHEXJmGKMJrBBz+JYduf2
 77mXORZoRNihip4zXunbDEvCxfBoQEBhkGj07nrX1ECjA8yyhVH215pIfeoeqHsHv1Y1sQcr+E3
 hmpnEEJtb1aiQ4IhBpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX+5eKbouQzq6T
 oc1nz+fvuQwnugT4/WkV3sE08K3J9DoQd8Bw0gLgG7jG1Hzl9NqFlsQ29xIA3aX+XDiqwAKczyQ
 HeEAH7sajFPUjNypUl2jgNkGu07b1gg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

Provide a hwprobe base-behavior bit so userspace can check RVA23U64
support in one call.  Without it, a consumer needs five hwprobe
calls and four prctl calls, which is error-prone to require of every
caller.  Most software treats RVA23U64 as a new base anyway, so
expose it directly.

The IMA bit is now derived from the same cached bases instead of being
hardcoded, so it agrees with AT_HWCAP and the "isa bases" cpuinfo lines;
on any system this kernel can run on it stays set.

Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8:
- Add Co-developed-by for Andrew Jones (Conor).
- Say in the body that the IMA bit is now computed, not hardcoded.
- Rebase onto riscv/for-next: drop the BASE_BEHAVIOR case's own
  pair->value = 0; hwprobe_one_pair() zeroes it since commit
  d0fc6fab2046 ("riscv: hwprobe: initialize pair->value in
  hwprobe_one_pair()").
v7: Use riscv_isa_base_available().
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
 arch/riscv/kernel/sys_hwprobe.c                    | 22 +++++++++++++++-------
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 8454a6ae6fd15..0392a8f41d86d 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ * :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the base
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
index 9a121ee3b4369..4f5d51788c416 100644
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
index 8a38a4d37806f..2290126792797 100644
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
+		if (!riscv_isa_base_available(hart_isa[cpu].isa_bases, base))
+			return false;
+	}
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -307,14 +318,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
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
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_IMA))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c049..f8c797b1d0fd9 100644
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

