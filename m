Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E7A2EDD62
	for <spacemit@lists.linux.dev>; Wed,  4 Feb 2026 17:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770225608; cv=none; b=cvituhAtDW4ZylUWj9Xg6g4XyTigbhPGJQbRjkumLXlbnvqre0/DKvezwU97Fnxnlq+HRk06K9BZePKbjQTF3hT7C0sXxVMOWS3bf7Ex4YcuXB5yLI7g02qa26HqnX7VA7jEkP8XDEehOcI9dsCdBMiEdU0rIoW6+Htu0jKnRhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770225608; c=relaxed/simple;
	bh=EMpRL583vOWVeU4W0hEVRiaRUtKRmUWLFzWTRy4Ou08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFARDeB0wMzFOhu2n/dAPw9uwUMr1Uy3xT6eoz5K/9D7L4NWzMkcXnM1w4X3wLEUa36NDw4btdikd5X1MptUq3k5+gVxUVJnZxl97Q1sh+Rpn5wePxp8mxtDKD8ldEV/T2UnXxr0l5kKVsbef7f5XNPl/sxlllV/LTUBCyVWPxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RFXJtpQs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wd9c5InO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RFXJtpQs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wd9c5InO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIOrn1245881
	for <spacemit@lists.linux.dev>; Wed, 4 Feb 2026 17:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VqbAWXuLedjCbn8BYtmfIasp
	H5UsLnVKguhalwtG8iU=; b=RFXJtpQsyEAGCCdZN+tDGI9L+WnvNuqSXFUPk8L9
	lcAV8QvF1PnH9HeHklAPrbDeLaVkFNPfY8c3UgGUI4EC0yeA03RXXmCLgORfy3hL
	KVcJ1zFrs5V+FeyD/jJZtLCaSnblXlrD/e2iMwaTWQ6/lZmbkG2kbAbSB/OchxCI
	rAwqTIFgW1q162Z0LnS9X+2XxBK6yJHYZIqcYsrFbSulI6tRip2YEyjIv508+M/C
	rSXjno9CW8ddAYdTBezoBmT2oNQlpPOMcuxD5OZGgKECkqFnWF3VdjpbrdiIBtQ6
	Hd2zFwgYsoabBkf4R4ISsr6e6dIDNZ41PO5UT6mM/Ohciw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ru9be8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Wed, 04 Feb 2026 17:20:07 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-124a95d580cso690270c88.1
        for <spacemit@lists.linux.dev>; Wed, 04 Feb 2026 09:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770225607; x=1770830407; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VqbAWXuLedjCbn8BYtmfIaspH5UsLnVKguhalwtG8iU=;
        b=Wd9c5InOzcHvgfSEek6zL/OB0sBC3hPWUlm2PcVoqSFlZ2IASMEYFyXvBeVfq1qlHG
         k+Ney8GR0z3N7x9RwJdgVZIDsOsE+GJ/bDmkMtg/ma1w3EzLl+q3vx/KKxwpLvBPl7kc
         jtXe4FEEJ2phltJulG6T50h3AgVL7ou4fJYUFbz3HU3UEUh0TQNSNdSpo6uQosh19BjH
         IzZYSc+F2qZ2P0WYZCb4WKXQimMxVZ8bnukVfOGCO3eYJb5WjEakmP5d8g1/h7FRYQdg
         SdWrVGOPtYsT2oCINAELrxZv1gnnNN6sE4+D6WPvUC1LoJhxVleitTbFZjmY7pk8GBr8
         lm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770225607; x=1770830407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqbAWXuLedjCbn8BYtmfIaspH5UsLnVKguhalwtG8iU=;
        b=r49Lrg39kUFXHnreUAqW1gIC3BONMYMDBb01GVT29iuJZfzoKV6aztT9UANw6KBB0t
         oaDKgE02xbIeNURI7KbbwYe+FRoSSpLlfT4wwc55NyC3l0wx/hShXEBz9fANUgzGXE/d
         h+Qtgt9JP1tTHLnJ+9zl7/MVLvliJPHnqwfR0+teTyC7fKspJjjoIbwosdKE3iM1Aola
         m9SuwLga3QCroiszICMSDG4IjICVC8tA6P8B0GKNOJKACrO+6iQeaenK3OEW5173Fxzj
         zjlCS388H4QHVq9tY5VyP+k3kMsda8KYpsLbDuun/DFE7jEvcZIKan20MkgcDvoVKQHO
         tKPg==
X-Forwarded-Encrypted: i=1; AJvYcCVujWjAt/O9AAmrhvzYqAxQ1OoqsxaQ2FInG5CmaYrVpQJR5/S4QVthmK/0mhm9TRlPoQT+tnlFqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVyaMPtg2oznQp2qirMPBZQ0biuLt4WyWcfYDawu1cgfpyWRG+
	/Ao1aPHVPs7WG2ybZxxGdKstUWPxlfczxVU85rotL8NfjlZ38hyb99t5wcENKgT0hMz7vLpXUmS
	vSxG6MdAUdpfwJdkc7ZIpSA1OLpdyQNTCGihMsNMzpooYjLq00qouISG72nfDPg==
X-Gm-Gg: AZuq6aKxBNfWMkK5YnE5utQQ21k/xHtKIk1iCGmHQ8Gnml4syC9phX72nlq7dKbzFBQ
	IPjuyyJJOocJjWtn/HcrGq6Td0Hp6MCgQsqRxBfp+Po1NTGdWQlzEbYfJtrRVWrw4JOwQ2vLUXE
	z3uuggtbiO8Lyz59PY/nTesw0BXrbsHaCxzxmRDv+6vI5TmSfskeKpggrWtAwVutaZfBDfkkKQX
	I3KcCeNNrMn2UyvxlACpOvkUWsMD+roT9vMq18gyuVUH+llUTkOQWf224wsybPC6xog/883PuSq
	8jB2cBO8o/kGjSdYz1liEcYrInFVu+XjZicfnc5062AzPxbwP3ov3UlWlNbfBWLmHXQaFdL2BA8
	ifqfX3uEeqxAPj/CnF5Y=
X-Received: by 2002:a05:7022:69a2:b0:119:e569:fb96 with SMTP id a92af1059eb24-126f4771f0amr1691819c88.5.1770225606322;
        Wed, 04 Feb 2026 09:20:06 -0800 (PST)
X-Received: by 2002:a05:7022:69a2:b0:119:e569:fb96 with SMTP id a92af1059eb24-126f4771f0amr1691793c88.5.1770225605519;
        Wed, 04 Feb 2026 09:20:05 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f4e107b4sm2433926c88.7.2026.02.04.09.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:20:05 -0800 (PST)
Date: Wed, 4 Feb 2026 11:20:03 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>,
        Zhijian Chen <zhijian@spacemit.com>, iommu@lists.linux.dev,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/8] iommu/riscv: Fix WSI mode IRQ number handling
Message-ID: <2ueryrki7uzpjn6rbqz7scy46sjhw76jjilddz2naslz3eyfdp@ycwf42eaw5yy>
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <F77F878EF7C59BD3+a9078997d97dacd05d1271a5390dfd08a402b325.1770195980.git.lv.zheng@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F77F878EF7C59BD3+a9078997d97dacd05d1271a5390dfd08a402b325.1770195980.git.lv.zheng@linux.spacemit.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzMiBTYWx0ZWRfX6+KE3ZgPVhjT
 FMP8gI2/GI9uhq32sMrA8SeWXl2ERiXraYiAqBBLvWJjGoj5UjHBt0xO/IMbVS0LiEbDds16CxZ
 fsVw1QU8Tp3pjP5Stv4gy3uOnK3n8c46GodyPG9dqfkKUeXXsPuspC2ik1MiAX5c5y3AdO4LfBx
 Q+LT5KfFs1MlJBo8fPGOj8EEZL+Caveh9cdOR+kwIbuQ68NEenCl733sbAX/O51mna1BUh+t7k1
 zPfx3fLFP4Q/450qV1FVuEM54GBzx94q4wzuTMecJYknZXS3Guv832shwBZG/bWmhbJgYDthQ9y
 rEa/FuiQxTWOsMVK6nItPHF4m3viLfxZFjCmfxUFBEJrDPQtEdMNQEKCBoiTc6pLWgoJD+JX1Uh
 WZuCt5GKhvHLSEpbbdA/OnpYdKMnjw78oRyx6ZsFhISitFNxZzA8OB0QjvzUTV4TMDUS6kmDblM
 y7YNQLjio3ISTBNh6KQ==
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=69837fc7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=lv0vYI88AAAA:8 a=vzWCA-T3srDMkzUxSWUA:9
 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-GUID: 9DYDrF8VSHwHX5hlCnA9UihM2YpMdm3R
X-Proofpoint-ORIG-GUID: 9DYDrF8VSHwHX5hlCnA9UihM2YpMdm3R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 impostorscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040132

On Wed, Feb 04, 2026 at 05:08:52PM +0800, Lv Zheng wrote:
> From: Jingyu Li <joey.li@spacemit.com>
> 
> In WSI mode, ICVEC doesn't exist, thus reading it returns 0, which
> causes IOMMU driver to fail to find IRQ numbers from device tree
> IRQ arrary. The issue is fixed by applying icvec indexes of WSI IRQs.

ICVEC always exists, however it may be hardwired to zero when an
implementation only supports a single vector. But, that has nothing
to do with whether wired interrupts or MSIs are used.

If ICVEC on this IOMMU is always reading as zero, even when 0xf is
written to it first, then it should be interpreted as there only
being a single vector (or that the IOMMU's ICVEC is broken, if the
number of sources is known to be more).

> 
> Signed-off-by: Jingyu Li <joey.li@spacemit.com>
> Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
> ---
>  drivers/iommu/riscv/iommu.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index d9429097a2b5..26630979473b 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1593,11 +1593,26 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
>  		       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 3 % iommu->irqs_count);
>  	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_ICVEC, iommu->icvec);
>  	iommu->icvec = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_ICVEC);
> -	if (max(max(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
> -		    FIELD_GET(RISCV_IOMMU_ICVEC_FIV, iommu->icvec)),
> -		max(FIELD_GET(RISCV_IOMMU_ICVEC_PIV, iommu->icvec),
> -		    FIELD_GET(RISCV_IOMMU_ICVEC_PMIV, iommu->icvec))) >= iommu->irqs_count)
> -		return -EINVAL;
> +	/*
> +	 * In WSI mode, ICVEC may read as zero. Only validate if using MSI.
> +	 * Check if FCTL.WSI is set to determine interrupt mode.
> +	 */
> +	if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {

The behavior of ICVEC does not depend on FCTL.WSI

> +		if (max(max(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
> +			    FIELD_GET(RISCV_IOMMU_ICVEC_FIV, iommu->icvec)),
> +			max(FIELD_GET(RISCV_IOMMU_ICVEC_PIV, iommu->icvec),
> +			    FIELD_GET(RISCV_IOMMU_ICVEC_PMIV, iommu->icvec))) >= iommu->irqs_count)
> +			return -EINVAL;
> +	} else {
> +		/*
> +		 * WSI mode: ICVEC is not used. Set to identity mapping for
> +		 * riscv_iommu_queue_vec() to work correctly.
> +		 */
> +		iommu->icvec = FIELD_PREP(RISCV_IOMMU_ICVEC_CIV, 0) |
> +			       FIELD_PREP(RISCV_IOMMU_ICVEC_FIV, 1) |
> +			       FIELD_PREP(RISCV_IOMMU_ICVEC_PIV, 2) |
> +			       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 3);

It's certainly not correct to set iommu->icvec to anything that can't be
written to the IOMMU's WARL ICVEC fields and read back again.

Thanks,
drew
