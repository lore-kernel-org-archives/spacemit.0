Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC0E45DF68
	for <spacemit@lists.linux.dev>; Thu, 24 Sep 2026 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246305; cv=none; b=P79cjYacHQcQEYPUwSlDJd82buH+yWCmky0+qcgT2ncAtHqQdZOgj0dxDja2bPE0MfwxyyuE0kwbYKunL4T4+LIY3HJOJF+vNOB2/5k0ffupU9Lho/81SnEuOcFdy7sdJhetfIGq3bIQUH6bQSZgf+odxJZGe9b/fIc5qyACRr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246305; c=relaxed/simple;
	bh=iRYgEa0QAMnnHBbeXblwmyNrfIIZOdOkl2Cx5CFRM0I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kUZuq8suW0o7fSgvGnWEBhJ4zFXa3LmKC2l+G5YrqM9Kn1+Jp6jtiI8t5C3SsvANflrYTNZJKYloQsvGGJMaRPQI/b88w8kqLlHNWHnvBrYqMwswI5p4Juh/AxnlhHAHydCgEyvjCdl2fy56a3y/4MlNZmnHlwPdRIinTzi4HqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jvz+aEYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SxYb7cIh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jvz+aEYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SxYb7cIh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PmZK1644189
	for <spacemit@lists.linux.dev>; Thu, 24 Sep 2026 10:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=; b=Jvz+aEYXV7Apcmn+
	vkfNaEKwF0eu+xAlptFyaL/dkXTPeYDhmrqrZLuhpNAXELbL/lJgXsqlOi8zFTa4
	Q6/qou+pPsUxkWlb1zrNHBtOg+IZKhPqsTr7VgozrgFjRGOebms+0BhhUy3EFOcD
	yYT9yO/vd14VNxVoyZ0uJkkF0f2bI6CYtsPH8KlghzAhoqXbmC581JoG4aLU1M/S
	GZ28uDcLPkDcBh7SMfUxZQ84V4H5EzqkU0kSwH2kU+XWqGxTYsYLrf7FzoUDIwFE
	9ev5oRCIecUoWpi20Z0tcSHyDifoPLgy1JWCOUhmbTLN7ebQueJtmCus/XUcgyQK
	R6lILg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrb3nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Thu, 24 Sep 2026 10:38:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so1423710a12.3
        for <spacemit@lists.linux.dev>; Thu, 24 Sep 2026 03:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246302; x=1790851102; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=;
        b=SxYb7cIhpTbyAF85GFxiBQ1mS/og9Sh2aUAPSIBSY6EQR5SuBScCm12ex7rs4JbcrZ
         YZ3Z3UrlwfyM3lKKLJ4c/+SE344nTN0SBCkc1v+soOpdtG4U88miDmY3P52Dq06/MNpu
         ZeJfCaldPZliEZ7YojQPzWhBhIhubDjtOJZ/x4VKf3vINFz6yInp7u51ZgxnniuJfeet
         FJ66a0tDZj5Rvi9aRe39KfKB3IIs2K1DzYhFhPjU2yWgO/nHK0lAwWcqfUQCsOArBfVQ
         Ccl9Ufr7u7P9f7Zb/iQjNAm90YgH1zfol9aMFl4RVyoYW4UHH83YXmYmR3KrSDcEBBcE
         c2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246302; x=1790851102;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=;
        b=Rt1GIYsN+btnKs4KMEB4oqlAehS69PxM+HKHepDcN/N9wZNt6wQ17XS0GBW7gR6nyh
         dRjZG10+qExGalwdmU/5BL2Aa1S2bsdwRa7/1emKzIa67n+jmsT977UT2MDoiZ2VFyT0
         15kmdh5wzfe1SZ1RLvWpF4EzqySZepDi7ctloxXwCQCw6QvDvu92kQegloFrdEO8Ikh9
         kqa/VtEGfUFVP1h5ldOmc4h/eR0GGm1eRO6/dNNS0p8Akn7gLtmazXidEdDxHSgwr4rM
         X4zT32wqxGe5s2ona3sGHsmLkk8XUNcn9VN6OkMpAjEBxaxvPLCCA9ZCq4xC757Lgb+3
         lSug==
X-Forwarded-Encrypted: i=1; AKwUvByP3ylkEinM+LuVDWVUdNsbj4U2GZYlnxZXy14yW3Q29mD30Uq4Q3zN43EH7fOrDrzBj0KIFfvfsA==@lists.linux.dev
X-Gm-Message-State: AFuF++liOYmSZ94qMmj1z0TI7dXTxWCRoRsmj57XReKuPzgUtgmG/wyA
	dRF6Jxd2Vj1dnOdocHeta/SDJEG0ZIVYYBCW+QCwpNUhGz7OTMhlwGwPWydQUS2SzJ4bs1kb+jQ
	bpJc3HqHdFC9yWIy5q52FANYBUFk6t9SLixPSdl2ufmB+wVnrN1qhDn2wcGaTWw==
X-Gm-Gg: AYBFou1YkYULvnOkktmbiI3dGRd1+HQ2O4zjknyWNyw4Nl8jxhfZw/13Lw3PXkmSAD6
	lrtMtCAwb5/CwDb1Z/+P+dK/pqdoBdmDjB6giPhPOoTc6y5qpt/utBHNEZ6sjfegRgwT1gRFuis
	5VvsiLd741T+GVovTYqKp2WfoIb6eEei9N+kIIz5gMiR+jv6FCt1CUFJmVA/r88gTWWeCybRRn8
	DYf/UjkInn/AJcZhzPYMjjw6AjPTNuefWuDzeDrRnugNu6yZM6yEh5EPSty1k2mCfQcP8bMXtkc
	R+CO+g/0lVdKVZa5pCBwMbfrREjM+ZC9pybZSomuQ47MTh2HN6POKmyP
X-Received: by 2002:a05:6a21:6f06:b0:3d3:ae40:51e2 with SMTP id adf61e73a8af0-3de0e75067amr1904800637.22.1790246302070;
        Thu, 24 Sep 2026 03:38:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f06:b0:3d3:ae40:51e2 with SMTP id adf61e73a8af0-3de0e75067amr1904783637.22.1790246301600;
        Thu, 24 Sep 2026 03:38:21 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dadae09sm2691132b3a.38.2026.09.24.03.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:38:21 -0700 (PDT)
Date: Thu, 24 Sep 2026 06:38:17 -0400
Message-ID: <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
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
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
In-Reply-To: <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
 <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX8tGvHsksL1Ds
 x+BpYOUoFOKF+pHFPP1T88gv4s4a8gTLTp0vVPTE9Q7hbyn0HMWNv2/gVJEHlKMLrs3u4tWPaqe
 m7GaMgqO4MFo5FfXmLAdWmKXrhcQvGy0SYLQm/cauMSq0vreoPKcTatAKtav/LA5JOxYlMT3V5+
 7xR5/Kfk9dXV3/PzhAwCoIS0rgfzVmHRJgUegQZ6Wb5EfwqMz6iKI3mg5c4tJlspJ9CinQik7du
 jHP3BhPU/hr3SA0hRzVmydANpCoyqNsgDt1nMfzEIW5t+gfCPUU7oXo7oyLnXFLSmIVBf45ZIpA
 9Opo67P5E0KpTxYZN5sPQDlxiYv8d3wpdF2LzghBItrjg/jSRG0TtwBeErc2N/J8ZNdX7gWNMgq
 KEed3si9xwij37rdwW7P6HPSpwt9N7isJjFRQVb2BEVSPhy2jAD7vu1s9f70fowNZdLxNMUMAUH
 GwqNJuDBd/Vpt9IaDCQ==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4fd9f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=TMGBcqugHITK_y5VCRUA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX2wzb71UmFhUi
 ReBSF4/pM1dUfOXx6p1bZu508fxx5bXRZImZFgrvhvSMBDasUquOXjRijYwoqffMSVzo0JGIRLW
 lHnTCxrU9uTdqUxCUNjU1tLTZoi5e+Y=
X-Proofpoint-GUID: 6W-vWpZPk-80fIdvRg4YMRpv_ZwY5xVi
X-Proofpoint-ORIG-GUID: 6W-vWpZPk-80fIdvRg4YMRpv_ZwY5xVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Hi Heinrich,

On Mon, 21 Sep 2026 16:24:53 +0200, Heinrich Schuchardt wrote:
> On 9/20/26 09:18, Guodong Xu wrote:
>> [ ... ]
>>   	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
>>   	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
>> +	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
>
> Hello Guodong,
>
> The RISC-V Unpriviledged ISA specification has this description of 
> extension B:
>
> "The B standard extension comprises instructions provided by the Zba, 
> Zbb, and Zbs extensions."
>
> __RISCV_ISA_EXT_SUPERSET would imply that something else but 
> riscv_b_exts is in B. But such an extra seems not to exist.
>
> So shouldn't __RISCV_ISA_EXT_BUNDLE be used here? Some code further 
> change may be needed to set extension B if riscv_b_exts is fulfilled.

Thanks for the review. Intentional, and the difference between the two
macros is whether the extension gets a bit of its own.

__RISCV_ISA_EXT_BUNDLE carries RISCV_ISA_EXT_INVALID as its id: parsing
the name only sets the bits of its parts. That fits zk, zkn names, which
are shorthands with no identity of their own beyond the ISA string.

B is different: it is a single-letter standard extension with its own
misa bit (in the same way as A), and AT_HWCAP on RISC-V is the bitmask
of exactly those single letters, so the kernel needs a bit for B itself.

A is declared the same way; with the spec defines A in the same words as
B. If I can take that as a precedence.

IMHO, "superset" in this table means "also sets these subset bits", not
"contains something extra".

Guodong
