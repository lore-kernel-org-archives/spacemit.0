Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E213A3DA5C3
	for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 07:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888806; cv=none; b=i+X/kxNrjUygExTYRSI9OuwtbAe9A2st9g6Spdl4T9Ia5ITz64QPAcTnePOy7hfzGB+M2mm6UZBWM2GkeY+z6njMC4xrexquV2IZQtf9b7HvOrfhPwgXDQZHi1r3zMiSflnBXnTkNTXMgG0N2d8gT/7YAffhEa0IgsMgIlRu9Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888806; c=relaxed/simple;
	bh=aPfxCLJi+U0EvDxv46wcRkt/XQMB2GdkhHKXJQ52sFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d5YSGtpW1oCPd9aPRkEb8ndJzcmusAN6jVPs6BJUFBZbwp/mCtvQwTPBi84Wy0nRbvuMuSmdEa9bLjx+85efDqxCVRFqTfCFZ6a42JG7BGx/7KgRysuVVFASXLBCuIzojWERdBFrtN26fsgBV2+ublq8HcxTJw/pOfoi0h/QYxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PD/ivfBk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fwZoUFCK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PD/ivfBk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fwZoUFCK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55mfc2097806
	for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 07:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6T5cYsgTvRzduRgb72gYHdCbpLkwk14QaTErBGhIfmE=; b=PD/ivfBkWOfw/+Xk
	7XROAGrQRMTa5IEgIW70TjHTzjou2z79BjXWdBXQw/6sJce0rmX2fH2maAckOUnO
	P+mRQS4Z88TyxdvPRSpOZcz705C4Rjz+tXc128I7o6+L5KBqdRE1t6mjkBbGhcIJ
	cUE3F4BL8wue83LTEvKcIy3skd30wvw5SizRCE4gENY9P1qE3wWNh/nf41YJE53h
	3oZWsgeidDpfYtWy9mRflfjBRDjqausjcqijyzTJxGKpH2XdHmPc8cO6QIvIP6Fx
	5zFTGvoQ/54L53pXpGDmVl9sFUhh7cncuem3/KDLlevxif6QLResxiFU+aO3gRWh
	dQDx5w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxthpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 07:20:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dc7337e2a7so26703475ad.0
        for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 00:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888803; x=1790493603; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6T5cYsgTvRzduRgb72gYHdCbpLkwk14QaTErBGhIfmE=;
        b=fwZoUFCKhVMqc+kvhiCKMJGvTvCXzJlq3iA1DELVjTbJGuL7SeoS3YJsVEg14FA++L
         IjII70CBfa/Tkex0qCGTEuyyKD3rsH3Mja4/HqEdR52RvfCSnKPhPxdIlc77MA+XKscN
         u8DoW76rm80RWFNMKo2fordwpAskh0Iq4+Dqh7mJBTYeTxzwd2i/cvwZHyaCKyODBCw0
         bgGTH42BnMVyKL6XyxM16muWigKVLuiSs3QUAcaO//k/PgjArUs+0ju7NIsNR4H2NUb0
         6EYKveYHNc3eNbuj3QUmH1ix/8X6wrSG3jxFwMQ7eXD4EqkZgvZHX51yRhPyfrY+qrdW
         9iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888803; x=1790493603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6T5cYsgTvRzduRgb72gYHdCbpLkwk14QaTErBGhIfmE=;
        b=ntrA8vEOzl798yrltqyjKAC4VJRhjYhzRz9wer2IBWEd3DPKtv7jcWM2PRLuYAzFRD
         OEvrpm6T+BOmcctnB3F5upjwYkmckMhA7nOMe7TGzeDMWsY/bYVkX0LBLoAzeIU8ESzE
         K5vypGVuEmfiWAHs4+9tu3WLTRljpTKxuith22srGYSlN0XGM7sAa3on7odHTJ6xpeaG
         VW+BX5o0j9c9vLrxxMrVrvrZziQQYsTdg4UERk4aHtE/we1j6xMCyMLvpkK1OxJHJ3Nl
         pN+Q6MNH6atVgfWyTN/ICcn71uRLn9c7SmlaK14OFy4AWNGt+FEbvXbPLwdhvtSMR/2R
         lKFg==
X-Forwarded-Encrypted: i=1; AKwUvBzRFx8PPRJDGwDPm2Mc2Iov2Vpd4aXqGcsVleCRVIgw2bdpab3yLnRbKZTIqavFaehcI26XzzQUrA==@lists.linux.dev
X-Gm-Message-State: AFuF++kOSgKsORBJCpRi3nZ23AImVhBGdVuaZzNlHSAivkqkpifvEgDC
	3NQD2ty3WmCF0RGeMnsTJbaJ+2d2KOA1Pz063yRfwT40uG2aBzprOSUYMf+37c8oTTzRG3ilMOa
	AqDrX4zlOu433jsE1Mh0CcbNG9OrQHY9iXf7mrmX6l9esnV0kw64In03bzICoYQ==
X-Gm-Gg: AYBFou32jl+edKAV1OKUdzcKdiIVD4Yq+CTxHRxRJfOmsRxDsdlvNBtd693UOFnoUUq
	tN3APbZYkVyIlAHQ9X/kMSakkBRLwjRU1cu/7D6Szl2HGYNJ+ELDNcEPStuSryVYgVIwBKkQqOq
	r+wRsApMhcmrH1VStROL+jI5tH1lH2v8O68NFtuTzOlxkry5IcWLd8wD/uzeAYWc9MonMSnb4Eb
	j9qCkOjQjwtu+Xo5leY4XrbuNjoKVZKwy0CYgFdRwoHxWTCBqpOLPbu6Unm/XBEoSv3SpxPElaM
	uHwAlLYaHOi7iktf4Hfr8NGRhqR7Sozu/tOW8Xl84TRhDcC603hiBYuoIiY=
X-Received: by 2002:a17:902:f681:b0:2dd:c053:e0f3 with SMTP id d9443c01a7336-2ddc053e127mr64135875ad.34.1789888802528;
        Sun, 20 Sep 2026 00:20:02 -0700 (PDT)
X-Received: by 2002:a17:902:f681:b0:2dd:c053:e0f3 with SMTP id d9443c01a7336-2ddc053e127mr64135635ad.34.1789888801954;
        Sun, 20 Sep 2026 00:20:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:20:01 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:30 -0400
Subject: [PATCH v8 10/11] riscv: cpu: Output isa bases lines in cpuinfo
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-10-5f14bc5c23d3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2897;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=JPdcEfltJd+KKaNtcEuE4Ci4m9uvI5VXrW1f/5ccPfI=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HadSOP76lkVv/3g653/Ys5TSvsvf52oX/tkqafyap
 4vNTGtGRykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAEzkfTnDP0trJz75AE+tyQ3p
 19sPHojj2Gs7bc5B+/oYvuNPZht0b2VkuGEbfNZvpc79kNqPq3zsZ9o2P09nlFof/SxcwqK75Ec
 TBwA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6aaf8923 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=iQKFDb15jVzJNXG1q_sA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX+Vwv554M9k/Y
 VqL3zAjj1ATOWg2hG/dNoCeAnW2DDkxtQ6jDnQSp6RI6ptgrmrGhTaErwKODNLFriwJ3ftpA+d9
 gIzEZuryXLV0h+D2uETDFp8ntuILrIE=
X-Proofpoint-GUID: SXu9pjx7O3ae_or2wN3CAFFq2QOuznyp
X-Proofpoint-ORIG-GUID: SXu9pjx7O3ae_or2wN3CAFFq2QOuznyp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfXxvU+CI00AKyu
 GZHls1nnYfJg4TPWxLJ8yFAP15+/1STQt39ceT5kW/VkikHdnHL77YtlTZdEShUEQwgiTdiELrO
 hMcHT5c7Irhu/hchKC3T4CJP6UWp+/ACky2SWg2Y7LLCcjR7uJL5vBXcCy4oQzMLZoUdMFAC18V
 lpWXg3Tsg4rvea6DqeI3uzjkAMrACrBxbryZXI8Jo06ROs/TbDyTMBgpFc6M1pn7N6ivNdXlHZ6
 iMuP22GFEYoSHRuMstYq/y4PpUS1FnZs/BxbLZpm9iTPdsjXAYns7YDg5Sr/2UZrA4CXEAyHnrR
 miOk7rUTqyct1FqHGYkxPYK8SwwSFxhxEHUutlSfUfDyCKbpqtO+2vIVDMXS4U4nQBGh71G+3pR
 3+d885uzyvImNmzKmlYC/rp33dQorfgKKoKl3owAOCPXb9o4ybtDQNH3OArdWAoMTpkXQWWKF8x
 RlNVDgTlHEpLRaWEE1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

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
Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8: Andrew is the author; add my Co-developed-by (Conor).
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

