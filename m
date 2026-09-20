Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B2033986F
	for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 07:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888790; cv=none; b=AAzXQcOSRIYmZlglAuPSyfkVJEGcKeZLZTxoEdkNlKMBIrpOctbHWVOFeWjE64dDMnK3K6JhDQvcr7NzHCkiRvEKLtKUO7n+d0c/zihbHRYo668fn4iQrcF7b//UAYY1XvQ1zkcIUyxKBlFKgm3EcH6r4phrbHZeCZZ33p3eJCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888790; c=relaxed/simple;
	bh=g34zrQD/5BTRdiGl3DWQ8K2L1DtPbajRAaQsgY0SP+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EDgiBsanK/d70xJJtApemlvEaJ5msXPUSg8kIJqfTWlnpHYPYpwL1ZhZT7dp+fnlgLmTOO3NTbIoRR1Ve8BHv+gvpOzkuejDTurkkHPUHytWj7wcFE08Fz/F+We3tQ09Z7thmSZu7DUYddWvg1geRMUJr7wJSUhJrSPQGpDO+Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ji9dB3kQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgz8S+/R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ji9dB3kQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgz8S+/R"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K551PP826147
	for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 07:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rwFEtfBjggCgKkBijtjyuel976Tg6Zs390SSgwRh0iU=; b=Ji9dB3kQ9pXQRV6U
	gKOfAccNEGUioPAO6HLB3san9AM2oQq4Qmrt7i5NS7f7XZeD8HJ+SKBop6FU9BpJ
	jMQc5QCeQshIWKSlNVSk3ksJENOtFF+M8Rz1S/5IA8WhcYiXCmcz+pIFNumrl3Dy
	grlJB/5PwGWJ1sbCXYjaz/w4u2ZGZyY1i+1LhzReVJ36Nn+yg6U2AlYAL95SIZya
	F0YLZo1tdPWb3x7/0blqgLVNg+Igntw/fxOiFXnNqOfWt0zftivt/dxNJUsu6AAe
	vk9WWpS3kFK2Z3pBp8qIldjtBNtbrZjGW8PBIWJAJg6XvDd/zpFlQL61did31olN
	BZw/fw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs82dtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 07:19:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3734d06dso37130025ad.0
        for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 00:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888786; x=1790493586; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwFEtfBjggCgKkBijtjyuel976Tg6Zs390SSgwRh0iU=;
        b=fgz8S+/RPXlj2+XYCssIShZnSyD0PDgjA0J0zKwBGpVLkPa1G9oe43S+eCjMWpZvK4
         lz0yy7/NfWYP4X966mrJrat/f23MRhU/khLHCAP8wbjh2PUu1Y9B5P5Y2UK1WytB/Tp8
         zVvHzLpvqQ5px4letZwdq7kb4QxZdWIn1WXJ5IeU9VIjZ/0mfESaawdjzMViMDjngqio
         g969YSwtum4xRD8jhMAf9I30lGSC10BqAu1TNzCPrXDFYarOHrLjysJhPG4tdUf3t8+5
         I3FhMBAcaArlyqKq8ehVBYx+vVfo044pQnz5B7Mf0f2ZO6Fj1Fr7YFDgwac7tiZ+D54m
         BgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888786; x=1790493586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rwFEtfBjggCgKkBijtjyuel976Tg6Zs390SSgwRh0iU=;
        b=W2CMt/3btiZzCzd3B2/NE0/nQ77gbO7GiU243pswVT1XIS8ziLu6yONRtzj4zRFNRx
         J1/8nZGGfIkhgr9AUWrPx8wGJ2+FaVt3337IVapI3VZX5+frbCoIIvZOUt1z/1dVbEf9
         u6U8t96TulEQvDqAjayL10Z46FTUuv5zSF8LO8VvMWWyZGbNOtOSCKtolZ8lkssvARa8
         U9ZmQfRejlo7yrcMEkBqUkoPUOPzkCT3lWDcZtTeTESBn4oDq6XhNFEvGeePOf06BmOC
         nCj0ar8QHk5cj6u/MlbnukfvHwmiaWY9h0q/X1jx8YLn3X0zkGesugNrPMFJMYTvtNbF
         EyGw==
X-Forwarded-Encrypted: i=1; AKwUvBym3XuejHD/0CylgiKSMm0Fkmi/myQn58lbhHPUTqfLzXtRljktyKyEe0vH6d92u1oYhRHU4LXvbw==@lists.linux.dev
X-Gm-Message-State: AFuF++n8lpa77bVk25vur0YAGAcEDHIhX8kDnuW8keYubQO+HI+Xk8Q3
	tv+QJbxcVgIoFJDx/brCSmVad3Pou4bMt8ULCB5RK8OcSGRyxW3AI4zNVSobLuBMQDd8qAljIKB
	35YgZtejPBfwFnMyLQi76lZ7Jgp533izytgqfMXMQVJnFaHV50yuzOhfrginCaQ==
X-Gm-Gg: AYBFou131T1f0ZyXGv5wuJceitCJD2KF3F3bzoGyFGLPrDibMS3UC0ua/Ndtju/2SV3
	EvCrAjf9bkHz0pS+Ykznm8dOGJ8JexbN/AR6+JRAI9GxtgIKmBXIuCDOoQaVoupv1RsmUH9OAeq
	mrtKZlui4THL3ZKJT56kJiHVzOd8w+Gzekn0vIHeZzMHRdHUUzNK3YqrwcSoEoxmTzlcnra7GQ3
	enEsWw5Ph/BzHMN4tohwpThs6TDqO/GW+F1EIjC8ui9YmcD95MzJocEZMu3RU+rrxCpPU2BlzqW
	QjXzn60y9MsqFf2n7UTZltioi3oV4qt8/6Y4cF09KkRQSVYJdz5Y4VSXVBU=
X-Received: by 2002:a17:902:e80f:b0:2db:56da:6a0e with SMTP id d9443c01a7336-2ddb1adef68mr123445085ad.9.1789888786394;
        Sun, 20 Sep 2026 00:19:46 -0700 (PDT)
X-Received: by 2002:a17:902:e80f:b0:2db:56da:6a0e with SMTP id d9443c01a7336-2ddb1adef68mr123444895ad.9.1789888785968;
        Sun, 20 Sep 2026 00:19:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:45 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:28 -0400
Subject: [PATCH v8 08/11] riscv: Add a getter for user PMLEN support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-8-5f14bc5c23d3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=Py+tkwh2uQDfg05jm/Hhva5ZsBCsjH6Y+7RDGQCi6IQ=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HacEjtS4xvTMTV8vbzt5xt8z0Tf2/jNhfHp9e8lTw
 X0sF+bv7ChlYRDjYpAVU2Q5fLQle+srn2jf55w/YOawMoEMYeDiFICJdOxh+O8TZOfXtXHJOyP9
 Ffva//xsMUs8X/6aJ8jYp7TBLksq5C8jwwpFfq5zpUHJsktlmH3YDXkOqs28HytYtzH6WaKz7Q4
 uTgA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: pxVARuYA5TFyke_Tas96ro69_cCQQESd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX4dokM62N8aer
 ner5JZ9pSG6wD365WbNSzzvu+tIvZ6t636HC2j8f2bfSESLcguSHnifWUAXBeY/rBaB9Kgdy29U
 vAp0zNOw29ICgITEgXlW5ULoqys5orM=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aaf8913 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A_72rIs-Kagud5g8OzcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfXy6y9JxGIfVtT
 RaaJUw0oUCr84GiQBOnHXd26fB2CtwmY65VKsXNUkzaL1qhj2+7rcJHhesCDwq+F+Q1Mvr85aV/
 Wwupr9sAHSLX9EFNMAacbot+xNgZgAheuaw6AHE/dOcIDh7n9jRL2XKI4SdeL886s3mN0kMG8PI
 MuwvZGo8N0hhIBAfP2gT6zs1nZO3xuaQQh6gVu8HXIDrT+gabmJoVtufq48ROf5L7l2KxAyaW7q
 4dw9xCfBE78zCYnDPIfWHgPlaQx0/LqIJKXGLyHBC4pMY6SRnmghH3eooh5DlGfF1/bG7tjC483
 p6VYThizGOm58GK4zukUk8qRdN+mJyQ9kjsDMRdtoc3As9MuweLdJIZExrHmadqQxNCAWiOtWpE
 CiJR9mpPhr/DzLSxrcbCJVBMhoPHyczKE5LJnBFNuhUtX6qoOmNY4ZcXvIQZtmPDWCC49lH2NKN
 IE2IPNyTf2V0TjtNzkQ==
X-Proofpoint-GUID: pxVARuYA5TFyke_Tas96ro69_cCQQESd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Querying whether a given user PMLEN is supported is needed for
RVA23U64 base detection from outside arch/riscv/kernel/process.c.
Add riscv_have_user_pmlen() to expose this.

Link: https://lore.kernel.org/linux-riscv/rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53/
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: replace exported booleans with getter per Andrew's suggestion]
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8: No change.
v7: No change.
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
index 815715c67f94..fafc8f88c69a 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -225,6 +225,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
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
index 7cc5a6a5c020..34c1d498d1ca 100644
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

