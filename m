Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B3046D2A6
	for <spacemit@lists.linux.dev>; Wed, 12 Aug 2026 23:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577759; cv=none; b=S8dPe6PUY0vcqWeVllJpJa97zGLzKPWHR+qwgpzxATwa4ko1lLJ163YLjC3imlVMYkYimIFaFnWpznN7GuK6pIZCz94QhNuRWhYXvq57UafMJAhdWFriPDc5EaZsrPMt8lt1tGtqRaGOjafMUTtqIGcKm1bdt3pqJYItB1tIXMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577759; c=relaxed/simple;
	bh=SgF0/fuQIfTNrS1fvPiZitsdgKYk3yzataCrp5aiRzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DLrCgma4dVDrYuJV8AIxlQ+cUFbD/jq0PscvcfLf4qHBrI5JIL08slP6SDg4EkKR/VL+ociAMhTpT8sY2AvTNnN2T6F3PQU+fOW93MivMTDdzZMXGR3OfzjBbfE+lUf2z5n+P15E0eHgVX6sguYTWTd+DXGQnxwtLJKHF4u3npE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSISGCsT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2oxp8f+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSISGCsT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2oxp8f+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLmFx1590399
	for <spacemit@lists.linux.dev>; Wed, 12 Aug 2026 23:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tqlPsdCOPbAGtcRg2u231JHmVHO6OIQXwPGrXSBWdqE=; b=eSISGCsTZhuESIeM
	OiUriQPxzY2s2V0MY9WDyLkqzsmVpZnNG10keHVUCjDiFYRrlVgif6nrx962OF0F
	LXar5f2fXWLH0r14Hbz8U/TmpVVEfG7HHhMGub4qz7LmqnrJQeHirLinATHOMhtQ
	ejVwUfP6txuX6htC+lNT5Xwx9oBW4YMhNVj1L01TSq7SkfXP+RBzmUYJjaZ8ic/1
	XrQPQ1J7TEVEWY7bbLz8jPe47CvAbBg/HLf9pvbhlRM/0tV+oZJH3Rqcr+d13K/I
	VrmiGC2Sd/aEGj1wsMao5nQrZGal/Ym+A4f/CcnDjoddrS1enzqecAoLHaarE8j2
	7WcqZg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0sk42ncv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Wed, 12 Aug 2026 23:35:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cd01a14e81so3027755ad.1
        for <spacemit@lists.linux.dev>; Wed, 12 Aug 2026 16:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577756; x=1787182556; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqlPsdCOPbAGtcRg2u231JHmVHO6OIQXwPGrXSBWdqE=;
        b=E2oxp8f+i+IJX1b+Yub7jQYPfy6lItlny642hJekH/4nTlFVaVnKjNOz/fbVVn94Ey
         k3awl+W2fcTto7q8d8mxDNPBHzFcQS1IBpzzx9E+a89Ndfyo1vBYOGrWtnuTjfq/ebJN
         9rGpMFx8Vd/iDxDKmxwWtEGHk48GSeoP1YlN3xisCAnIkbOMtVb2TvDCNoaeax+kKq7Y
         glk1bVzjaH+WEjfPyzWXh4nYvp3Rdb3g6q5T1LEl/+i7mVG4Ur857ev/QDL9lGCvuDki
         97OxmOhcJl3Zrl9JiBtuItkwxzae5PSAz1vV7h47PDzY1/4h5vv+0DweLaIPKgEg5fwy
         joIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577756; x=1787182556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tqlPsdCOPbAGtcRg2u231JHmVHO6OIQXwPGrXSBWdqE=;
        b=V2YqEph7c9yZESq2pQB6My6HGEbeZA3FwyjPoAWDH+Aotga+9iYM3u8Kv31IoSut+z
         E7w0tLJlTvSRMJqoCypci9lPkjN76gZ7AZlKq27/GwfHc4JxqDj65QLByePMcJQJYGEv
         wiidQjfxqg4EydAwbIUXneOrSe4jUB+5AJHyrccxyLoEfztouPV595dc/DtTf0Oysdjo
         dIcdIpfEgqgvYzYAYeVBb9yLGl4H4qq9N0b5N7nVn0PrBO71SJwc0Qb1Sz2vmQoKFtia
         aAF/8YQmWi0sPrlb8pGHR5FYjqsIjF4lI3hDMM81RVk3/R2DCu7mgVzQ97eWggm80AKn
         g15Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqk6XJHYgnWPlhNJGEC7kIg1Xdwcv6GxH17zrA+fhfXAOPcyo/JaF3+8vQzj3lDO8dbRhoaw2VN7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrHap2xJCXg71NIyMTCmIKaQK2KGJbOBSRWnqQh1GkhtwPO7sc
	S1PbFeomBCEbN1YF6VLSgkfg0LBSoRnlOF9GrIXitktLOElXRC0kIuvsFSzixRXuNlO54ZCqZyI
	r7Q2wnXKQeQHbLqC1Rah7DcxX4eG9PEDkXcCfPkjEk+7c9W589tYour7kpBYEjw==
X-Gm-Gg: AR+sD113B+sLh+LTZoWzTEYO4jjs8Ik9qYnqY4/+zIBaU92KQ6No3w34e1jrq8VZkMZ
	YVRt8W6KyaRoDX1Pve45gwR/vG/doLvbkQq11bcI7g4lwpBMh9g6sFnT3N9MqQ9dlKX+Pm6q7nk
	9hk5KwuIjRbMRIbIXdlp7xnp4L+/LV6VgMmagJB9zLC+QkBUK6dRFdZ+zB6RqYbK3ALtnM1blsl
	AqKUfVcNlQ2pwDjhAzxUf1q3Xbfd/eSPFwGLsrLWTCYRfgIcD7x9pvR+Qf+/iWDIlCdpY/UvyYB
	t+7b+jjkcnFYFyMf3sUZ2HhT0tJUWRbwxiwwTSLHpewlK+hG7G566SpRGU2qQA==
X-Received: by 2002:a17:902:db11:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2d37e86ae4emr13015295ad.17.1786577756329;
        Wed, 12 Aug 2026 16:35:56 -0700 (PDT)
X-Received: by 2002:a17:902:db11:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2d37e86ae4emr13014995ad.17.1786577755873;
        Wed, 12 Aug 2026 16:35:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:55 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:54 -0400
Subject: [PATCH v6 08/11] riscv: Add a getter for user PMLEN support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-8-c985af3256b8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1962;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=WJTJFyxuRvfcgUEXUDYQIHOAlpEPJJlnDq2dMpcawTc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZrGrivyN7P8q399daxNvduthVmLbWt0/4Sw9Bu5VF
 t/OJNp3lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwETsLBgZDjm52U9sdMzzlXC4
 MCvRTEc/cW/XtDk/PmlXtLD5Rv1cxvA/671i0Jp7ziqvXv3eG6pQwhB5eo5C7OGUh7urA5xnKcU
 zAgA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: UASkID8L-ztuM0K7LALPAZoMpTACULFF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX4Bh41bir/Twn
 njlszNi8PJNNCqZi5OQaL1Dq45Shfo9xC16jm0CRGPbYQEoNZDD6FqkHop3Ysc66UOUolKrggiG
 id81EcoWlcC34muVRVNrfgEdY97E8vJ+qrhnOsoMcyUdGn0S8NaFi6fK5UE8lWlFpahZP8EA1gX
 FoTlz+qm20kFqDSbvWZXw20ggaMBt9gxCJkCFxxPH01GjuOqjwjlYOsH2ulzVexEbk5dESBDP2O
 wl/G/aFK1wkIvGFkODr8ammns9phf1CZBravVZ8hN+g1IBMJhcmLceLesBRBOMdyvzjkgOJwpEG
 ik+wDmtGw/iXZbDF17JrBysNRHZWF7DVWEM69TakYeJs27g6ujK6FPZfPvGBLs+tk8NBJLyPLwu
 DsdHt8KttouUCsrcG4iM7b5UgOmlG8hYYSytuldEnVtEug/vjgZVr1Rl9RLABKfFpxLwq6wdJMx
 2zxSW5okUG/xtsKTuFg==
X-Authority-Analysis: v=2.4 cv=E8n9Y6dl c=1 sm=1 tr=0 ts=6a7d035c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A_72rIs-Kagud5g8OzcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX+Vtls6j3CYK6
 HCrfpF6wX08VbL6eQSFsrb271PWQm4nTgBWV+BOgVPRiUShkGq610FlDM+WaXiTD3VXKTRS81k8
 dccw/Yy120uoWNtUSzOiv7yc/EAKkkw=
X-Proofpoint-ORIG-GUID: UASkID8L-ztuM0K7LALPAZoMpTACULFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Querying whether a given user PMLEN is supported is needed for
RVA23U64 base detection from outside arch/riscv/kernel/process.c.
Add riscv_have_user_pmlen() to expose this.

Link: https://lore.kernel.org/linux-riscv/rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53/
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: replace exported booleans with getter per Andrew's suggestion]
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: No change.
v5: No change.
v4: No change.
v3: No change.
v2: Add a getter for user PMLEN.
---
 arch/riscv/include/asm/processor.h |  4 ++++
 arch/riscv/kernel/process.c        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 49a386d74cd3..da9089695ed6 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -217,6 +217,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
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
index b2df7f72241a..5d9cb108a623 100644
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

