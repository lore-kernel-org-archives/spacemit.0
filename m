Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFE345D90A
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456647; cv=none; b=q9y+7OP9Lv4vJh2zSB7As5d53rdPPXKMeQcX+pCplNj+nSu4gMgnhShYNAlAt0iM9EwYkjVdV+Z1ahqfoUbkdYj836gJ5tWsU13CWRljeKo7VG5xVylrRpSSaJBQvBj8cdT22sEim8gBy56lw7y9lCBHPmmJSHbiQA8uxBk2ETY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456647; c=relaxed/simple;
	bh=kukhi/WZWswDj0RguMnTyGaUm1wiOQMTwL4qZT9oHT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VrUqQPb0JyclN8dtRxmzrTce24mGllsvHrRdL0BiFObghzj+iM7lBm+fvd86IPmGD2Y5KQNpAsRMBTG/Kgp+uokZB9uKCNZXzsSDZLovWDkvQ8m04qzhkUqNtKTiVpWNwJS5CMjl5mKELMxWCSOgMAvfrM8p59Pn6Cd+lqCES7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izyFaTsp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=buIB0Web; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izyFaTsp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="buIB0Web"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Zlpn2792534
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLaRf5MNT6bdfuQJzz0+hxaTdxUHjMAv6d0xpyWSYCo=; b=izyFaTspFQkNFXi9
	dw0DL/rx7ZAfUbaRUECkHMm3rNOX4BlZzrNk/6RUE5fPrUmQ1WxVkxfeuFaHLMqR
	wbrzpMg0+OH0+S0gUTJyJEYpp9KwPvKg0gIOotDUn7B7vcDs0j4+EtYw5gSYERlr
	vB/ZSxokxxXP2K0ZPwTT/CmPx4U5KGwZLcXdb7Zwe0tlIRc/Ig6zVXHhZfGAklU4
	0rC1kAxsq7bVL59qteRPtXkl2RQKLe/cx4dOrLPXkfoopqVsU1NdJnjI56jCxMWG
	j/1OWL08HNumdXlIGblNANDdjgBSJ4OSLwUv8aQjPIjcCOOOgMAA9V7ahKXB3bWJ
	SWqZpg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtm2k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:17:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de1f85cb2so2258791a91.0
        for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 00:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456643; x=1790061443; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLaRf5MNT6bdfuQJzz0+hxaTdxUHjMAv6d0xpyWSYCo=;
        b=buIB0WebO7BFNJoPIhJ2w2rfAnHQBkmLERMUs9kEhMy79vNod5uIS2ZRi3Xc6/VyAG
         QISE4FIfNQhcoupq2HZIhM2OmcOlw6dqmWceyTYdMpcQTnx5xq/MwxErPydx8WDDbS4G
         KVeZPM/wwOHqQupqOZ4oUr7uUaDh3+eBWmYmdIDJ79vBSk1pIHiQNnYe1z4rs8C3Bww1
         aXwqFW/GBbVRHSdKRXl/EkOW1aQwXea0lnrGav8u+LQFIobsplKXM8058GubytF472YP
         sWYaVxT9WBQuWRQEvPwZ8mnO4X/nEvfaI11gIrFDbI0pP5ac1A5ehcjC/53Ivx/CsKna
         rwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456643; x=1790061443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLaRf5MNT6bdfuQJzz0+hxaTdxUHjMAv6d0xpyWSYCo=;
        b=PBjYn0FgRZ0/2L/Tcz4QmPTbkEEm2WPXP3mxaBJ6NHyHNj2+Ju6Sw/N9lhZPSVf08M
         /0UDud7X98SaiOHg7JvwqVzhJ6ez0nRewZgeihqJrThh+IuOXLJiAncuoK5ipmNJAAfS
         qto4WdJ45J9haZR1EKi0vwUJsi7VStBaI7pgp5o7+21BVfmuRprbqKZbPnQU6wLkpXM3
         /8H27ESAtNQq9wz45qbMwapaZoHSBLa4/1QDisovgUVYpxbkaq8JmaIxJem/889KyF6Y
         5/mCK5iCgCoLe9w2cushcsShgsTy5t8ixmyzTiDWwX+jB0JzMOsi06io9N1Y9jVQZgTU
         jNvg==
X-Forwarded-Encrypted: i=1; AKwUvByZF6oHF2RftlB3Fbkwhmziwy4xONhvMv3WumPN7ctcJmgNNEgzZnppJfED5ecjrywtJCX5FTtiXg==@lists.linux.dev
X-Gm-Message-State: AFuF++n6OuyxGiv6pxhpoNrH8VgU/YvhtNEU3wbmMxXXrHNkIjL2dAme
	j/SGh5N70w9+PH3Z0j7udBCOYjJik+XiCpQwKkZqR2B2IGt6Btodh1kX+9PyTMQc0+2ZBSMWzdy
	awsCDPZlc0yg5QGo0VxQeEleJwlue0AqBg9qvkrSv4ZVdYZipY8eCQOYAIHN5og==
X-Gm-Gg: AYBFou2VTZSCMyxR6ilAcEgbvSRqblZaDVwZ+P16xhYth0qjqU2Fkkl/UCduTR6W45y
	rrQMGwvD04ZuiJ241XtfmTiQEInyDKH6UU1o5qAeJgopiWi7F2j8uOlh8RBrvTKQIzSVb1zvRcK
	av3lIv0MCXfI1ry5IHXU5XbK1P9/97bkj1F5dBGSFfH4J/guCsesY8jmujYFPCLaSI7o/xF8Nu5
	flTLcVPudNaEswVnEevhEj6lE/5OqGWEOOZexOFhvXoGn3MFY+ewh2e7zbKsc8BJ/NTVnGBB+SI
	Dq8kRzPpzdE6WiTVAbSPWcb16Wc2b2oL7FWniMqI+xvWoheeA+72fG09fnBR
X-Received: by 2002:a17:90b:4f45:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39debf925c1mr11925792a91.9.1789456643010;
        Tue, 15 Sep 2026 00:17:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4f45:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39debf925c1mr11925727a91.9.1789456642507;
        Tue, 15 Sep 2026 00:17:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:17:22 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:34 -0400
Subject: [PATCH v7 08/11] riscv: Add a getter for user PMLEN support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-8-aa35ebd9ae96@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=rqiM95uXML2sMynfTJbBvcXeaGjmecCzWZWIwJqroOo=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7bOfaP34dHv5gAH59qrglKXfygfk51TXp0uM+PCl
 xc5tixMHaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjCR82mMDBc+l8+0+eBeGXT0
 o8WDvP1zkoPFOBbPUplaee/kt9OaLKcZGeb6PmSvmKhW+jl0w9p9hvfVNvX9YmiPDKvpvHbO7ne
 WMzcA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa8f104 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A_72rIs-Kagud5g8OzcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX/c5sVkG/2NWM
 3gZ/tNHm29VLhWgzN9srHU+R61U1FNwii4EW9zbmKxexRF9XolGzp+kZ18C1qv97B48TvJpk44E
 QWZmaHnqMOOAY7HxpVggkZQAgP4FPm0/8vcNs6yp1mh0ar3hBtf+qFwhUfFoV63nueQH42Ctjvj
 LqP8slWHuuAe8zt0axbnnw49VUwJcHsFthlZ6Dh1UXdsoXneZin+++3l4ZiEUSZtNxNskZ71qGt
 IBeC3zOA+HuLcBDwd4C4DMEGAeW3z39XfVuRXBI9A4AZH3vY7QeTWZOofH8KFVYr3B0bKy/+kj4
 NTrtYlswaFYi03X9vKcIBkxfugX/z2LAxVVFmj9t9vY6JRLErQIo3aJFswsBfjm06xNGCMeqw8x
 66CrrxizLfAXLyQd3YBSazM2vB4eTDpJAI+bhVMN1oogGg1ztlf00fTfhL6aGJ+7qjQk64LGjrW
 PEi5ZAZY7TRWE2rfPzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX6xVV+NjiVGLj
 f7WD/jDvjJJ3iUEw3oa8JO+nu90HU1RJt/p1///wd9jWcsb17zI+VNFzHDguZHrB5OcESdJpEcv
 Hk7zaWxgMOfstfkj1KZcg98aQMZozSc=
X-Proofpoint-ORIG-GUID: pNcl5HlrtX3i0PHvRHVX1kM-0JrqeK8q
X-Proofpoint-GUID: pNcl5HlrtX3i0PHvRHVX1kM-0JrqeK8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Querying whether a given user PMLEN is supported is needed for
RVA23U64 base detection from outside arch/riscv/kernel/process.c.
Add riscv_have_user_pmlen() to expose this.

Link: https://lore.kernel.org/linux-riscv/rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53/
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: replace exported booleans with getter per Andrew's suggestion]
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
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
index 49a386d74cd3f..da9089695ed6a 100644
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

