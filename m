Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C314145FFB0
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456622; cv=none; b=FU7ZEgZPtidALIyjXAinOBf+6Cu6QfUeWnDWqytH9WFTcX0+jYSKr1DlQjf4YxaIQjNJQ6Dt1j3xkrTPamuFhD4YKEIeqN9I4lXT32E7jYMnoDpkavJksoOIkQQla+KPbOSP/gVG2ASJR1oBmPgP7p1amzTXYp07Uw36C5r+faU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456622; c=relaxed/simple;
	bh=feFwK+YKcjxOr/G3tWc50jSg+BloxgqVLDY49oqg3sM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WJyIhuwDQ9KnJLU9jU/6HuesDhb+HldV60kl2knR87DDe/JNXaUY4AXoV9GYSCUZUjFafVsxt3jIiKVOw3Wlgdnukt59xVyu5dkY48BBHwJ28hlzgJ2dAGv9AnaPdn6ZcK1bKf3cqPn62YpODXqefr/aoFmEGtehUMR+xLYuL/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kz5axk0o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ro4KSSBU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kz5axk0o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ro4KSSBU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Zc5H3824026
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bib1p+BD2+/9MYZY81r3Zrm+xMekme9OPjDE3KXqXYE=; b=kz5axk0oPAa6ORBv
	oa/GHEOdKUBTGNm4AFvyqqsVFVqOR7BhGAQpklkGwr/AwrcnaiBAAtpGrClwXBBZ
	h68G400IJZnKemtYIZGPUUSyzxc0u9Q8qcsuI3lMPo/UAMxApjA1EDvzW03j+/5Y
	AFTMGQqp+9Iym2SoSZEYr97fjsgEDzw6WDe5+ihHi8/wDDp+Bz2UyqIyYj1zaSeq
	VNZi2Z2BlLiINAM6rDSHJwA2dpYj3eLdwn8KeNhjqKBB6nx1OJbo8l+J0iFhtKIm
	ahBs4bk6WbQq3YOP37EOTJyCnKTxvkC6l2C/2YqTZ7AhRT9WROX4Md1MNpAMJpBr
	W1vQFA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41u0q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:16:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so7209410a91.0
        for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 00:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456611; x=1790061411; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bib1p+BD2+/9MYZY81r3Zrm+xMekme9OPjDE3KXqXYE=;
        b=Ro4KSSBUgVABxw+RhEzeGsdEEDfdO1KjC3mNEd5dfvaNzTr3PGZeh1spiKHe/7sEy/
         4nZZllAhAJdJfo9NPCZdTtY15olOAF4Q3Ymfe5jvb3euMMZMIYkXBFu9LVLhUvsmPVAO
         kepnfvYJaJQwpfguras2ff+indGKwkJEFAJNcycO6uPwyqvZ6xRA8KpakQurjtn+3M5A
         Onr4M2EXMRguQJsEtIqYO/YMTLyPYTGdu4A1IfabgTyo0cHwuRTorzy7pAYatOUjIjGn
         Jb593VjEDQtHtQIVY9OeS9SXxbz/GCbYuNkFr5zam9Gko+fgbXygH0LT5jBC5osS++9V
         aYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456611; x=1790061411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bib1p+BD2+/9MYZY81r3Zrm+xMekme9OPjDE3KXqXYE=;
        b=fPetTNJ2g84gBcErWWOoazJG83iL/vTJBebzDVh0j9YblMj1zV8fZcS0E3ZMGzs8cy
         hoEjtby7wQINX4A5VLEPB1RNyK5wPf4mCHThgz6h4nbCok1ay2PneSbY9QwsflSscEqz
         XK+tQOF7Zx0Q6K7Uks/abMn6Q/Przb3QqZPLsEgUf51TXIOIIPuWqnjXACBTaArW9PFC
         v0vHNohTBGifA9MZxQtR5lpxVd+cMVVp/tbxKCeZnhiKyBLcSg6xMK5WKQ98ev8+gA8c
         Xcd2dp6Pn9qFhL0gl+E/nLRl6m7c6LEQxo351mqWR4E69d0M6puCh2lJdD+YPckIovNh
         pNwQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8T6z3bTf6w+Pd4IBfPJcjTZS/q6CklI+MyQE6Hedp25f860LZePk5je57HBmz9uMSNndxNPOvPw==@lists.linux.dev
X-Gm-Message-State: AFuF++lOK61JpJeVaLBjqarYAGalW0FPXt+7EfxY+3jEsaJ6guJCy/Yh
	1BliK6VIMSRYVK663mUJV0lltPaCxN7qdOLDku/h7NWeh5qByYKtWOMI/HB9o/XJYKduKC77YWA
	1odpUHcUJF4ETn7CN54Rx9BLxczd4kYvhPUTq3GOyiG7eOuSnsZnqHTpf+e0vng==
X-Gm-Gg: AYBFou29KCAnUJs41iAPNq3fuNGLZ0zFynzgwQvRqrti1jhMm+OrDmVyJSWnRQRMepe
	ey3wLIng7bUIONC/WqG1syJKbk+xr+yUnGCpxOyaOXVY0ltvpLqh4fCUGnKwkZJCO22tj/cznI3
	mn8ZAmQ+EmRV5DrOirDEQHk89aQvUDiY0DoqvHxvC17RXhw9ok4kfve4hPP8bZgAn0xgKECdkaI
	RUlb2sdXmlpRHw8+gh63cJd9mfCYeyLoqNBCRHVX5LQEsprXgby4eU7lNhcM73VVcaaN6L+nlnd
	+DGapDBtbktNFy6U412YLWSswMI2TWJO38P5uGHE7qGmNfa7iC2ZX0SXiVcR
X-Received: by 2002:a17:90b:384d:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39dec0f7135mr11151410a91.20.1789456610951;
        Tue, 15 Sep 2026 00:16:50 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39dec0f7135mr11151274a91.20.1789456609849;
        Tue, 15 Sep 2026 00:16:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:49 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:30 -0400
Subject: [PATCH v7 04/11] riscv: Add Zic64b to cpufeature and hwprobe
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-4-aa35ebd9ae96@oss.qualcomm.com>
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
        Qingwei Hu <qingwei.hu@bytedance.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5858;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=O11yGb/wRFqA37mTtx66TEu8+w8Pb+GTV3KD9OD/Jlo=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7aI/LjL7XXKLGVebOoDpa7nnYWFTOvm78vsaklNi
 0rNUd/XUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABMpdGJkeOJ3mPXx/fdPmE9u
 vV/mtObOk2+PZn1cKhi63GOBfHjAXFmG/2Hv9D/a7BS5EyoiftAjcue1I3PjnD5oLz+g9JJFzee
 IBi8A
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX2zYzNi43/jjz
 N5WmgY3O1wTKI/1tpyv0yBr3q/p10ZFIV0J6Hf8GfbgyqfA+8OsAsjK/QU/jK5oyjMFT+p32uST
 5cNRnt5o+g+gYA2H1Ymf0/WKkISCfRb9IegpT77+YG2esXInWLub8T0BADKpiK8XI4GMcoMpBgh
 5UstkOWQ3sYIt0Iqxlrq143JQXxgZh2mhx8WYIFTXl5EmyuCubgkBtFxjB0Fwjd78NsmeBP2JnW
 w8pcZ5hQbC27n8yD6ii1g5r/huQSpdP+yBJZSP0mdHA/7U8O4BsFzO1vjZm7zsm4qRxrQRmbEYL
 eY58ohCoW52EDqldU6RhJsVeNTKx7KimI/+LOzSJr9igOtCgY24lWzQcjy7aUHfp03kyDB1e4QA
 OTfqwqgl8KO/wjOM7qN0kUV7TLpP7OvBZGsttEYWRd3J0opQDLrEb7zVwqJLP6Ai8zSYDKvOT7g
 LzLyckk+RylnNCxObSw==
X-Proofpoint-GUID: wlbSUjpPLLGFVDD2g1BYDlauGP5OTB_V
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa8f0e4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=HwFc7jivAAAA:8
 a=968KyxNXAAAA:8 a=EUspDBNiAAAA:8 a=XYAwZIGsAAAA:8 a=fFnMLytXjIv02VNa_WYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=kr7TZk85JJIQSqC0cl8G:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: wlbSUjpPLLGFVDD2g1BYDlauGP5OTB_V
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfXxA1EVa41kYAQ
 XPRVMSXvY8fWNklMqXD9GoKpkAAOExTGjNeNF4t/N67TsehDFkOrlWrazlChskQNezIAO1ljL68
 b5GncGRqdFN6ovKVNG5Dpr4Gb1MvVKo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102

From: Qingwei Hu <qingwei.hu@bytedance.com>

Zic64b mandates 64-byte naturally aligned cache blocks and is a
mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
validate callback that requires each cbom/cbop/cboz cache block size to
be 64 bytes when it is present, and export it through hwprobe.

Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: No change.
v6: Rebase onto riscv/for-next: RISCV_ISA_EXT_ZIC64B renumbered 110
    to 116; RISCV_HWPROBE_EXT_ZIC64B now uses the _BITULL() style of
    commit 8da45c93dfa9.
v5:
- Collected Reviewed-by from Andrew Jones and Conor Dooley.
v4:
- Credit Qingwei Hu's earlier Zic64b cpufeature patch: set him as
  author, with Co-developed-by (Guodong Xu).
- Validate only the cbom/cbop/cboz block sizes that are present; Zic64b
  does not imply the CMO extensions (Conor, Qingwei, Greg).
- Add a Link: to Greg's confirmation on the tech-unprivileged list.
- Add the missing blank line before the ZIC64B hwprobe.rst entry
  (Andrew).
- Did not carry Andrew Jones's v3 Reviewed-by: the validation was
  rewritten (present block sizes only) and the patch is now authored by
  Qingwei, so it warrants a fresh review.
v3: New patch.
---
 Documentation/arch/riscv/hwprobe.rst  |  4 ++++
 arch/riscv/include/asm/hwcap.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 arch/riscv/kernel/cpufeature.c        | 19 +++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 5 files changed, 26 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index fc68dea397aae..32a14331eb9de 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -425,3 +425,7 @@ * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
     in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
     presence of the Zba, Zbb, and Zbs sub-extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6a693210b2519..b103aaeafa47d 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -123,6 +123,7 @@
 #define RISCV_ISA_EXT_ZICCAMOA		113
 #define RISCV_ISA_EXT_ZICCIF		114
 #define RISCV_ISA_EXT_ZA64RS		115
+#define RISCV_ISA_EXT_ZIC64B		116
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9323feb7c3c81..9a121ee3b4369 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -123,6 +123,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCRSE	_BITULL(4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
 #define		RISCV_HWPROBE_EXT_B		_BITULL(6)
+#define		RISCV_HWPROBE_EXT_ZIC64B	_BITULL(7)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7f615d1a175b9..de7cff5f48c34 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -136,6 +136,24 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	/*
+	 * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check the
+	 * cbom/cbop/cboz block-size (when declared) device-tree properties to
+	 * avoid inconsistency.
+	 */
+	if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
+	    (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
+	    (riscv_cboz_block_size && riscv_cboz_block_size != 64)) {
+		pr_err("Zic64b detected in ISA string, disabling as a CBO block size is not 64 bytes\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
 {
@@ -529,6 +547,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts,
 					  riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 12ea4f39a8381..656cb100ac489 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -208,6 +208,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 		EXT_KEY(isainfo->isa, B, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIC64B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

