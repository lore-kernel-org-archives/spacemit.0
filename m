Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34DB4218B8
	for <spacemit@lists.linux.dev>; Thu,  5 Feb 2026 15:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770303869; cv=none; b=u4+E9xkDBi5Y8/3G27+wiR/gV/oWCTJilyZsQb4zxWxrA/SMOX7RksBe6LEj+Ey/RoKoul3M0K3mG9K21M2KcLURoHRUvpRN9y3mc9FhWyxq3zXF20PCtTP/gn34EDho08ONvZj9pW+i0d0vzzMdjF3gfVY2LmPiWgZzJCK0oOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770303869; c=relaxed/simple;
	bh=SUsEwkuyVvNP3vyBu9cxsyIKK9MZJsYqzp9t9GalqBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRs3nPfcnEqJbX4zs0TDqaTh+AURUQQBpMMcn2ulrEzWOxAuwv84E8wOge6j31ieAq2WK7v6bSW5lsSZoYpnXD0kaKMSDZ/qEcd32vpB+o9CvERZMf73PXshylaKuDDJ+P6/kqnvl7XDb8m+t1WwV9L9vtk0MrNMIfJSvQAxHDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvdZEEh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIUTLpzF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvdZEEh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIUTLpzF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615CN3pg4165727
	for <spacemit@lists.linux.dev>; Thu, 5 Feb 2026 15:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KfBltjWFs/4bjLl10PANJ+We
	wubPhQqXLGvIdvHvBRo=; b=OvdZEEh9XkPxnIwQcO8fsStOxA7WybJudPm1SCz+
	XQ+z1brLbXcUFfSgLIZCWzoy2jRfANeM6wwnOxYVNoSDwyBs/y/7x84JC2lwgiU5
	05x9skkTvIdMC6LHpFImXlJMqa0DMau4loxb9fKpXzryA2EovY+LCtU0LJn1iaBp
	Sk2d0uqf2x5NVk5pAB7MCjMzBap09SrJA2KKXacL5/dkW/IaKgDVnAYUQ54h4zuD
	AHX4PVEDKrBviVzdf00Du6PHrYlQvmgwiZcYLcgtVu9GL+0ahE0QPqbCdLPc13Z2
	FFBty+5mqMDEkZzACzI495/LgKdmO/2yd/8QduqH3p9FrQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4neg9n64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Thu, 05 Feb 2026 15:04:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b71bdcd037so716048eec.1
        for <spacemit@lists.linux.dev>; Thu, 05 Feb 2026 07:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770303867; x=1770908667; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KfBltjWFs/4bjLl10PANJ+WewubPhQqXLGvIdvHvBRo=;
        b=bIUTLpzFNcHqkJK/mb0T0MEhpSGgtbb/QWTZLJ5KHLK6SsSm0Qrja5oNj42AaxqZDo
         RU1h59NCv5aMEkq3JmasJtWO56m68QPJq2dxTUyNCA4TbPzptckEDFf1lr89PgdAhRuP
         gWpBOAPye9E/a7CELR+CLCmKlYRmhBrjCpk7fepEtHaerPoKjGNNhijLnQVP7TCfx4hY
         f2j2tcCh9AL85WIxto1MjnXAG7Dr75Yl95Jax7BVH1nMPtKxcEDdIdNT/e4Vzkkv9vhf
         2CGeqXQfWryn7Ut017//pEyUFDRqi9azbbkpNpWantqclSRT5SyYlriMvpM0TgbJdTG0
         1paQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770303867; x=1770908667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfBltjWFs/4bjLl10PANJ+WewubPhQqXLGvIdvHvBRo=;
        b=bdOMg3Y2C1aCKuAmeggRz5AWo9epdf/YYNapWhLj0+4adFeNTnIE8Yp1QGw22EZPue
         z/goKFYwabitnlmJfsj1gH+lbHsRhi42Pc9hzWN1TdJgcJmdzABRLcylt+ZN0a89LDdH
         wS3JW0ViMPfU/k624fm4UJ12G2xUIMGb+DJFEUhvx7gHS/f7UlWmonG4dNJH395qwBpc
         CyDNdOQXb6sJnz5JcSM2ENI1suK73ZzMOJmf3zfWYZV3XrEdCVCE2QxxCizPkHwUTyDM
         JiZa1hx4aT1kAj/HKn+tFvMDaBHg518y/7cjHf7WTs/m/R19QN+wHpXHzDTJ2SoXyDbs
         45Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWq3HWTDpQdT1BgOpemo49WoTXdWbCuip5G1X0JzwpcUB7a39iLBDgH9VdS5eTPZUs+nnEKVkN2dg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz7rR3aKYwbyaBEyIayxUW6t6Ffeehq3DNL+cD7LgD5HIq5caQ
	GzNT5EdIxG3vVxoc5sDgBcWwUTLxkQCRepB7n3temVCWqAB040KF6DW8rHEaLUIYfbmT2UNzGoj
	L83dt9VQH6iP2cVBs7TVwTuf4FR/TdrFxw4Mjb559cUpBCMwufFVY7ccIFxq3/A==
X-Gm-Gg: AZuq6aLlALy1eoPy/0IZGEnqtne6gfPAZ5Mpogvp4S+gYDA42kmZWrypBB8n1xT/E22
	EjWn4NQMb6JR8Kk7n7HXsycsaOlxhcmAa/nngKJlPWDW+zjDvyCyxKPesPRUuVfoMDEDTtPkQJd
	qtuv/TTfBtmN9k+clkjuzZvAZM+S3szDfzRjRoy6JS/H18tnUI0q2TkbmdxN2iICTq5Jfc4nZQF
	SUGWdK7h+YUVmGcmOgxqPOTxRFt4gg/og+lYIdMu/Z7CK8tVTzC+Y53hG4awEobZsRoA3vOj8Uq
	aMRXE8TatWZdGgrE8jzSnDe/0l4YlH40VRKzYWFPz5YGaxHodoIRN1qPRehj3ZV05T/5zx7EqfD
	H7K/bZ/tL8UBsJmlyW8E=
X-Received: by 2002:a05:693c:2c0a:b0:2b8:3224:90fc with SMTP id 5a478bee46e88-2b845e48ae3mr1234324eec.5.1770303866783;
        Thu, 05 Feb 2026 07:04:26 -0800 (PST)
X-Received: by 2002:a05:693c:2c0a:b0:2b8:3224:90fc with SMTP id 5a478bee46e88-2b845e48ae3mr1234303eec.5.1770303866168;
        Thu, 05 Feb 2026 07:04:26 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832e12845sm3491862eec.5.2026.02.05.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 07:04:25 -0800 (PST)
Date: Thu, 5 Feb 2026 09:04:24 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>,
        iommu@lists.linux.dev, linux-perf-users@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/8] iommu/riscv: Fix WSI mode IRQ number handling
Message-ID: <qlnntgtoaatvdpyvusjhe2y3hickopigwf3sobtnsfwpfhwjiu@zi4auf65eepa>
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <F77F878EF7C59BD3+a9078997d97dacd05d1271a5390dfd08a402b325.1770195980.git.lv.zheng@linux.spacemit.com>
 <2ueryrki7uzpjn6rbqz7scy46sjhw76jjilddz2naslz3eyfdp@ycwf42eaw5yy>
 <927D288E956D61AD+d1488c72-afff-49d2-bb6b-5ef5ea08b627@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <927D288E956D61AD+d1488c72-afff-49d2-bb6b-5ef5ea08b627@linux.spacemit.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDExMyBTYWx0ZWRfX0I+vTWpYUDFz
 bfn8pvYsSuTXPLBMqvxNkgRgafacS67wvh+J33XuE3sfuvWTZ/Y2JGie+nfZIQhx771SLrxrxWu
 KTqkeE5NJf1vYXoGfMWp6FCexp1HREwma8N3kODTdAf8YQwDHK661I81aZs5qXcI4tF4L/syTUa
 NT6fPtRL6mWiuVYJpRSZWE6sHhorbZrQERK4cELSsJ3155ieBvxQavPM2SeKM7aytDbqivbVUsQ
 QDHj8EEwIRs8l264lLRycmBUHRdqmIAyp7ap+To2mBXetFrF4mL9LK3Ue6UJCilhkdd/uio0tP6
 jBFDU4F157SEmNqQWPlCxB2pKm/c67GkKohQ4pgjVG4aqfeKbh0U2kbjC2Krtop3ZjSvHf+1BVs
 bOW0THGVAazyKnISG2WsBmlAHsKVOlSjc7wqQcRIUpTZRqyfGkz/YajWwSTTeZ0REf6h7BgCu78
 UELptoiQlsZcuDmXrLw==
X-Authority-Analysis: v=2.4 cv=ZITaWH7b c=1 sm=1 tr=0 ts=6984b17b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=2SqC6Y7SbBa8MZsB_aYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: SxRtz-r-pmUARucty5Kiha8FWB45nuB6
X-Proofpoint-GUID: SxRtz-r-pmUARucty5Kiha8FWB45nuB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050113

On Thu, Feb 05, 2026 at 11:52:57AM +0800, Lv Zheng wrote:
> On 2/5/2026 1:20 AM, Andrew Jones wrote:
> > On Wed, Feb 04, 2026 at 05:08:52PM +0800, Lv Zheng wrote:
...
> > > diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> > > index d9429097a2b5..26630979473b 100644
> > > --- a/drivers/iommu/riscv/iommu.c
> > > +++ b/drivers/iommu/riscv/iommu.c
> > > @@ -1593,11 +1593,26 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
> > >   		       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 3 % iommu->irqs_count);
> > >   	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_ICVEC, iommu->icvec);
> > >   	iommu->icvec = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_ICVEC);
> > > -	if (max(max(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
> > > -		    FIELD_GET(RISCV_IOMMU_ICVEC_FIV, iommu->icvec)),
> > > -		max(FIELD_GET(RISCV_IOMMU_ICVEC_PIV, iommu->icvec),
> > > -		    FIELD_GET(RISCV_IOMMU_ICVEC_PMIV, iommu->icvec))) >= iommu->irqs_count)
> > > -		return -EINVAL;
> > > +	/*
> > > +	 * In WSI mode, ICVEC may read as zero. Only validate if using MSI.
> > > +	 * Check if FCTL.WSI is set to determine interrupt mode.
> > > +	 */
> > > +	if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {
> > 
> > The behavior of ICVEC does not depend on FCTL.WSI
> > 
> > > +		if (max(max(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
> > > +			    FIELD_GET(RISCV_IOMMU_ICVEC_FIV, iommu->icvec)),
> > > +			max(FIELD_GET(RISCV_IOMMU_ICVEC_PIV, iommu->icvec),
> > > +			    FIELD_GET(RISCV_IOMMU_ICVEC_PMIV, iommu->icvec))) >= iommu->irqs_count)
> > > +			return -EINVAL;
> > > +	} else {
> > > +		/*
> > > +		 * WSI mode: ICVEC is not used. Set to identity mapping for
> > > +		 * riscv_iommu_queue_vec() to work correctly.
> > > +		 */
> > > +		iommu->icvec = FIELD_PREP(RISCV_IOMMU_ICVEC_CIV, 0) |
> > > +			       FIELD_PREP(RISCV_IOMMU_ICVEC_FIV, 1) |
> > > +			       FIELD_PREP(RISCV_IOMMU_ICVEC_PIV, 2) |
> > > +			       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 3);
> > 
> > It's certainly not correct to set iommu->icvec to anything that can't be
> > written to the IOMMU's WARL ICVEC fields and read back again.
> 
> Indeed.
> It looks I can keep icvec returned for WSI and keeps the write-and-read
> check logic only for MSI.
>

You shouldn't need to touch this code at all. I don't see anything to fix
wrt the spec. As I said, if iommu->irqs_count is known to be greater than
one but you're getting zero back from ICVEC even after writing 0xffff to
it first, then ICVEC on your IOMMU is broken. Once you've confirmed that,
then the best you can do is add some workaround for your specific IOMMU
here.

Thanks,
drew
