Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAFE415B7B
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456664; cv=none; b=ToV22MiNFKATGFQ74QjMVyJRpoeUAuM2+06QwvEjxE91JxIFbfjKDHq8myaygjye+tWXOBF7d2m4lQaVCLIGvWGSJKt+FCTaJ61oeav2mh0k10Vju40m2XHR/55M9RxZcDDaq+qDOfuwUsE1xQd03s5lNsYTdCXHeB0PcLIabhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456664; c=relaxed/simple;
	bh=MFEXerAp8YkUeh1632oAcakBkgoa+iIvn8OYQFJJq/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gi4Q6C6X1jeQijYx5BC+69vUqOQRv3j8IOY0g2uoO81bZJbz0/GFSaXy4R5VKPe2e1tNHOWwFZFmyI+qWajGEGR35/Ev/wjIqXbbZd5UVvnnCvoH22WgW+w1l1MSWt0aTa6O/L9splHL9kbDbdXijSjI6l7khIqc05o4Mxl5/Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljcbxh5g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjM7Jb8z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljcbxh5g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjM7Jb8z"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZkFJ2792516
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bl9v/AgdP0OwD+z9bA97aQ99CJ8kyJB54LPdNFAL3Tc=; b=ljcbxh5gBgC5LYEh
	mseWdzdISqshcJZLWNVvf9ju2i3w8FWfDrKb9DcuIPRj0u1JpTht2dqfbYnJVnlP
	7qKI7IE/NicBdV5NDBMtIb9jvQLz7vncAQmsc/GuhP/KM+i+wLk9/uBpeoDX9OCg
	KbsTLB1GKVEz4ViTD/wgCd4ojrjxl5Mqgxf7echK7ORomS52oGF44xZhBKQF88zK
	74sR56TwfOf/6yEydMj1N4dWUqYZ3caGzi7s8+MP/6YNaB2niqaPzco24wRrFeiU
	9Ku+z2kFa8Lxc7BhlRJQt7UpQHR91n4i/h37wTuh9lwwn7g57S7wOtik8vCSuQR5
	WY7m7w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtm2my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:17:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so2344361a91.3
        for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 00:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456660; x=1790061460; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bl9v/AgdP0OwD+z9bA97aQ99CJ8kyJB54LPdNFAL3Tc=;
        b=hjM7Jb8zHmcixeOrEQprKeXdZN67Xt0wXa21qdk8wJ49njY0rmr4GgObE39LT14m8x
         Pp4YRLeAvgNfx914sj2eUDOddmEi1Gz7cfot9opmSlaXYlbH9pGH3IqY0GgZO2VlDSNR
         8UMO3wrBoEcACe6N8bc0zwsis7wkTDNHhZKVtT7CZGNP104aaXobJdKQuFuwvvYClK1K
         5akXByAUAjPV8zHG7Ho55ONQ12JXCa3GeLzpbmNVWdpzLIwh7qLFC4ILFriMUb8ffmCu
         TTE12IU+Qle/qxthbsRpkjJ+itCtR8In5B7MDFSR2M/sI9hJcMOMEH2UjSD8kl+lTdr3
         B5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456660; x=1790061460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bl9v/AgdP0OwD+z9bA97aQ99CJ8kyJB54LPdNFAL3Tc=;
        b=zRhA0D0CwMhzUyMfgDNPAEgiyw7mt/wtsTKTDKvnxW52d9Q36KBu10Dv8vPo5uhPfi
         o+p2aeMdrqBaq8R2DJLC9TvVIAuBYaV9+1J28U8PwLblPS1yZbp6O/K9YNse1l9HOota
         PuHxnkfNAWczadkZEKX6IfadrxrAJOlShRc05GlfPRPachayEL/kZTOAzLiA146t6RCX
         fANyp6EfIw/GGz0rW8IbW66ii8KsbVSmqmf/8LaxkuWeyOyXdnrvWckEAr350FDXcZf1
         nnPkDAK4LOtUpLp0Flj8fy9F4RH5GX1n7NcEhB+k5xWLopfd7ri1Lzlx1+L5P9oXW/mb
         1A3w==
X-Forwarded-Encrypted: i=1; AKwUvBwU3nRXYSHqGS5BLT1TWWHTuPp3rKcx5eoFvffEeoxhCHLwdsIxiSVQSQZJBq9vuWirpON7wvzEGg==@lists.linux.dev
X-Gm-Message-State: AFuF++kRY8cEbH3FWamWSYg/QEnGDmyQsUDgVUjTf0i/wbipchb4WbBQ
	uuvIRCXqLxDETiWUMRt4id/T4E9d0jnM2vwvQf3aye/q+r9xWlfzP4pokpKSQ6GD7dZ4Opn/ttF
	zYz+U9Cneb8z3bjfLoswliExQ3a9pjR1bvIA3f0VEbywRavAE4Re6cfclIF2AwQ==
X-Gm-Gg: AYBFou0gXXLKhydtAIZpFBs5a1Yt/VPmS42/uayjYv3Jhmx2NbkPWR3OIwVXqwTRQk4
	2krVQt6QqhAMxaE5s4+4fEGDtXYZOmRL2jNsEAMu+lsbRKB9NzY1GtlA8y/0pHZiVY8d+pmBExE
	sBRzPWIZW+b2RHDBDQuL6WRFDdEm5KmIRb0sWygllEsoN9uFe9zfvqGdvNzv2aS4zmqAcrTh8Qr
	WfuZUIutmQa4b7nlzM4iLxcHJIBxHAJXEXjKo128V4YrB0m5ixo1jtdXpIhFiu0oBxBHL1tcrFs
	PTqZJn4EKNmx/6iPFCdtZz5szgelCQoJRF+fITs3QEOk5fVo8Wa+En4k3pCh
X-Received: by 2002:a17:90a:f16:b0:39e:b7:cbe8 with SMTP id 98e67ed59e1d1-39e00b7d278mr3590017a91.5.1789456659724;
        Tue, 15 Sep 2026 00:17:39 -0700 (PDT)
X-Received: by 2002:a17:90a:f16:b0:39e:b7:cbe8 with SMTP id 98e67ed59e1d1-39e00b7d278mr3589957a91.5.1789456659306;
        Tue, 15 Sep 2026 00:17:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:17:38 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:36 -0400
Subject: [PATCH v7 10/11] riscv: cpu: Output isa bases lines in cpuinfo
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-10-aa35ebd9ae96@oss.qualcomm.com>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
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
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2779;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=MFEXerAp8YkUeh1632oAcakBkgoa+iIvn8OYQFJJq/g=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7bZ1ogEmMSfY9Oy1bh0rMZyYUpccPK+Cxpmlw4ec
 vA5ZXS1o5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACai1sjIcHHTx/Qdf29cUxGf
 ub15s/LP7Vcnhl451Wpyr6pCXqNSeA0jQ1c54/Xc1X+3zqv7LLRrbsfJd0tXmJUKx3aq7blcoqT
 8mxsA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa8f114 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=iQKFDb15jVzJNXG1q_sA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX7Q1AFnFjFoNB
 WYJA1o4XRN5bKXnL0ZOXYQDpG4MXEAcwGHA3b207qK639uNqfYNt2KfoRhKENAcu5coDli9wgxT
 WlzIXHUg5GFBn9OD+7lfQXB89B2xkMZpuZ2D4BL0eTqE4+7IhQk8jxzVc6e4UCwA6S7DW85+YN3
 +rqZrURGGDFuW4F0REToOG0HvaQegIExyHm6HnuwmQRen92V4NyC3ArgG8PEQwdiyCO8dZJIpJB
 PKimQqz5WJsKoBDE4C18n3yukaelvpT0hlMNT84kdfrWKzUbSZFSRUXj1orAbR4KpzwumkZ3/24
 cRa0F2RwUpQOMMYTYlK4o2tSI7AqC94lkXp2zT5G4Ya0vTak+zePVgjj8uJztR+a7QaydklcUlQ
 rdIDVU+AhxJbUbMYq0FplMtHem13kJAfFKDszPsPSDVQv87//cHQv1jOAbBVBmbjhCkhN05HZ25
 x3Dwyof033l+lxKeCbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX+uobu2fCNgz/
 igNET3jmQWYdidyRj8FkOZXiB+K05TfBkx/xQi2ouEvBJGU1bwlxngAiSMzATIZd/CIIC6ntI7s
 hkXyovmkHvWSRO5ZRqubA0kYjhBymG0=
X-Proofpoint-ORIG-GUID: JOZvyz3nwU9nFmOJ5DEss9hUYREeTac7
X-Proofpoint-GUID: JOZvyz3nwU9nFmOJ5DEss9hUYREeTac7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102

The "isa" line in /proc/cpuinfo lists a hart's extensions as
concatenated string, but not which profile base it satisfies. Add two
lines that report them directly:

  isa bases       : <bases that all harts conform to>
  hart isa bases  : <bases that this specific hart conforms to>

Example output on qemu booted with -cpu rva23s64,sv39=on,pmp=on:

  processor       : 0
  hart            : 4
  isa bases       : rv64ima rva23u64
  isa             : rv64imafdcbvh_zicbom_zicbop_...
  ...
  hart isa bases  : rv64ima rva23u64
  hart isa        : rv64imafdcbvh_zicbom_zicbop_...

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: Use riscv_isa_base_available().
v6: No change.
v5: Simplified the commit message.
v4: No change.
v3: No change.
v2:
- Read from the cached riscv_isa_bases and hart_isa[cpu_id].isa_bases
  bitmaps populated by riscv_init_isa_bases() at init time.
---
 arch/riscv/kernel/cpu.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd1..d06824048aa25 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -305,6 +305,26 @@ static void print_mmu(struct seq_file *f)
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
+static const char * const riscv_isa_base_names[] = {
+#ifdef CONFIG_32BIT
+	[RISCV_ISA_BASE_IMA] = "rv32ima",
+#else
+	[RISCV_ISA_BASE_IMA] = "rv64ima",
+#endif
+	[RISCV_ISA_BASE_RVA23U64] = "rva23u64",
+};
+
+static void print_isa_bases(struct seq_file *m, const unsigned long *isa_bases)
+{
+	unsigned int i;
+
+	for (i = 0; i < RISCV_NR_ISA_BASES; i++) {
+		if (riscv_isa_base_available(isa_bases, i))
+			seq_printf(m, " %s", riscv_isa_base_names[i]);
+	}
+	seq_puts(m, "\n");
+}
+
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	if (*pos == nr_cpu_ids)
@@ -336,6 +356,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 
+	seq_puts(m, "isa bases\t:");
+	print_isa_bases(m, NULL);
+
 	/*
 	 * For historical raisins, the isa: line is limited to the lowest common
 	 * denominator of extensions supported across all harts. A true list of
@@ -360,6 +383,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 
+	seq_puts(m, "hart isa bases\t:");
+	print_isa_bases(m, hart_isa[cpu_id].isa_bases);
+
 	/*
 	 * Print the ISA extensions specific to this hart, which may show
 	 * additional extensions not present across all harts.

-- 
2.43.0

