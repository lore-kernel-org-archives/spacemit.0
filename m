Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66463B3C05
	for <spacemit@lists.linux.dev>; Thu,  4 Jun 2026 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589016; cv=none; b=rfJ1LxZrqSB7IauA7vrnvZI1Qtjl7QjdLSTMOSizzkfobo3Mlaxaoc18TUuYOAUBDpPyIG1NYzuNnssxhJddU3souDja98iESRGGqVVoEYBn3pSNnRfjhIvfUTTTJMQpHCnW8hxwJ2KIZjJtgkTB1XEhGtbt+qgA3w/O9deL6aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589016; c=relaxed/simple;
	bh=Mpc15BTxXFPLS7siOrt94DVTxzgWbPGCx4J/ojX1QSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSepAESagvAyMqxidh35w7fWSvFRXKDkPnIWnpd2hDUVfObjBXr4agtVJbGj+prUvYUstum0pp/ajRuqk9OdpgscyF8B2yoqr/s21Y8gwvW23XtDqs9vYqFAX/O1oIFNLvk70SLrRhrDaNoTyhJJPDMXNeQqB4WOQJEsNmZjJNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R57WYhlK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CPoQ9XWj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R57WYhlK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CPoQ9XWj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6549v1363233931
	for <spacemit@lists.linux.dev>; Thu, 4 Jun 2026 16:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8T3I1JSi6bPzTWMglkCJmeKM
	pAKkFgJd3nlCAFBxxjI=; b=R57WYhlKJl3K8bFUdl58ZqjkhTtCV46ZT5QO6j0A
	Kddjcmp6YEGcd8WIruVAt0ZMvC+hOWwkGsLEYz7Yb32W3tRSjhQMXgZc94DdG/6u
	YU3sFnnQtRqKdtqQjus9VHxy5Ee7e1r+jsPLX0pbfzq5ydcL/dpmaF0z9cdGphrJ
	/WYa44pwTb1IiQegKIZ9sqhZSST8w2Iiz/tW0BAkpcmqQsPp61iSH/YrPG4o0pxF
	PHXOOSiUGCCBEuyEbblKvDPdgi5d/iDCJwe1OMDiZjxZ7Cg1LrZfd6m3m8FpJylJ
	7poDjZlZipbJF3WIo4ECfDqr2LrUdd2XCKi/I3p96YyXYw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s4qn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Thu, 04 Jun 2026 16:03:33 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-440e399d049so1008661fac.1
        for <spacemit@lists.linux.dev>; Thu, 04 Jun 2026 09:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780589013; x=1781193813; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8T3I1JSi6bPzTWMglkCJmeKMpAKkFgJd3nlCAFBxxjI=;
        b=CPoQ9XWjF0bxd5XoWtXvxJ+mV6eCpLz0/LW+lmLSTik9AQpj/V42a7N/YLJmdgIvQH
         n6/LiTSFIKjW2ANsqmeSPpNOWIP9TdogcHC7vlyWSujX/71UGgE9dE5m75HiBAgEi0c9
         hED00BBFKOW/o/y8t7EbK/+LzDqMNaqLD5iOZUgvB6+nvs/duMlx6m3PpGSN9GYFhNkC
         Pu/bMpEfsXrl1J0ruToqQZ+XC4546fYS825RJ3yjWhRnetrTSG7DWvnnnwbgUut3KEiV
         8l9eabMVqPKsCCCTkATszy9AX/kRQ2OqsRrXT2BCQMyypjBXGvCDTtVETWFMFPzS7lLh
         bmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780589013; x=1781193813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T3I1JSi6bPzTWMglkCJmeKMpAKkFgJd3nlCAFBxxjI=;
        b=ocIjW8s4YBHaOznsTRDo+K/7B6s0VYqSFT3JqyIqLt/2m59MCo+tt318YPxru+qH34
         XtPYjzUWGeNiSLiq6weyqmpCaGxc7MY1b59/J9+hqbTu/oH6FmShGlBq1QMjuTB5J9jf
         zs3hg+zz+ORJRp9s7EDlw5IzKduMimIBREC1qKhfzhvN0GgVYmhzd4qFOLtl7Lwe7LvB
         vXmE5I/7rR7+xwx3DJjIYlhNoewO5pAGSFeVEAeP4bh8Dvby06DjsY54zo2d78VqtBDC
         hC6+5zPZILSk2GRnjYXYKbKQiY66wDxvKb9JVW9ik80ia6k4IYhB7iJU+OcdY0gzyVTd
         I+4A==
X-Forwarded-Encrypted: i=1; AFNElJ8ylhFYZVffErnb+T3BgohrRlYwWsd9xyq8HVdiMR8gjPvEM7Fbm00qVNAU19yylynDTwIEWJ+T/A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3DjJ1iC4wTkvRfCnBqTtGh8bXumJolBcusFLvTcS1OxjWU9TB
	VCLUOD9rSyPIX3cOwjRXfuMf0aRd6IdfIOKsAp3liiqp3dH9BrxYVI3FITCgNKfgJcN9rFW/1Ac
	CQTLB8I1JzspdDJXfMh6A47C/g86dnGH/fa/aqMBQuutPbc5LLl0BlF0ATGVTxba5EOR5gg==
X-Gm-Gg: Acq92OGFOZYuvkNU0ttqpWe+UiP01iTVR6IFiMxJ9CKxHnco4NIkKzdy2y6XvZzoV4I
	UkQjDXN5RsXxpSgDOZi0Ep37Ku2lggqvjnfjid3a+UUC/zSKbrPiMezZvkfrtYUJ94cz+hVE+/a
	lYpgasfRD0dl8yORg+bxY67PRtXLVOxDQZgXMcJ3S2ZBmUvC3XBVIvtkDSqLJIIskzVwV4TeRgL
	1Q7BnJISQI/pK3dWsfMijR3xI7779V1O/ZLwWRlRrifjARKP+2qexUHANO4hT+x8c2LfjyWfCYU
	EDh+kf+4OBE+C7CGxoeaL6n8QJT7sY8Jb6Ry+wM9/D8eLe70KAG0i1G9AFNWeWLqf9q+hywNbQk
	Yxz4yQJ2J9A+MXcJchp38Ia7BJcyuJs3eJ3U0SD4UYA==
X-Received: by 2002:a4a:e681:0:b0:69d:fb2c:77ff with SMTP id 006d021491bc7-69e480787e7mr3547557eaf.30.1780589013025;
        Thu, 04 Jun 2026 09:03:33 -0700 (PDT)
X-Received: by 2002:a05:7301:100c:b0:304:4f23:4466 with SMTP id 5a478bee46e88-3074faa488dmr4046204eec.15.1780589001468;
        Thu, 04 Jun 2026 09:03:21 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db55f60sm6911110eec.6.2026.06.04.09.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:03:20 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:03:19 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
        devicetree@vger.kernel.org, spacemit@lists.linux.dev,
        sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org,
        Charles Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
Subject: Re: [PATCH v3 00/15] riscv: hwprobe: Expose RVA23U64 base behavior
Message-ID: <dyafwgy6wgahizpld2vfuk56nzhueh727u6vzblmasmw24vb23@uw46cc5sxpb2>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
X-Proofpoint-ORIG-GUID: c6AIVOYWvF8ZYf2eA9RY8FFknX3zv8kN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1NyBTYWx0ZWRfX40+1OhQ/cEJG
 DxMfmkTEVHTUzhkOyf2CzvrryuWR6hoGamsLXQwzkATvGolEEVxY9UpAZsoL2PeIQIw7++jpDNc
 PvTMRS0HOASQhSBK4tg5D4xd7t8rXwtuPzv1HKZt/KengFMsullggPXUdv6WpFNXuFC8Ituupi3
 TDOoL/AH/V0FBJ3p7K4qgOmZ/Rtf34i0gkDxRo/+l0m89pnOg701ZQKV6u2Bp7AHhf6Xb4tYAmi
 oj+tF9lOKV1Hpgb43dyMgR9SfyCl4DqpK3AcDFfz6GpB5KdflSq8iQPFjpsuMEU6/KW2QltORMP
 tkWkps5ewJGb7jCnHqT+oCRI+Njl7bpAe+qpiuJwuFfyL46zntFmUxSGJnhBVpr9JXZoe1ejyS5
 o7fBso7jmAePVspyWDiKPAGHUzzU0Awz1Vh1M30IXCPFP2U2Kzp7F8VgNzNIEPV034lwO0xeYGk
 Q/xqHr7nyF9nmeZ/hyA==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a21a1d5 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bmEhWVV90QwrJAxICpMA:9 a=CjuIK1q_8ugA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: c6AIVOYWvF8ZYf2eA9RY8FFknX3zv8kN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040157

On Wed, Jun 03, 2026 at 07:11:55AM -0400, Guodong Xu wrote:
> This series builds on Andrew Jones's earlier RFC [1]. It lets
> userspace check for RVA23U64 conformance in one call, instead of
> walking hwprobe + prctl across every mandatory extension.
> 
> The series adds a small framework that resolves profile-class
> bases (IMA and RVA23U64) from the kernel's ISA extension bitmap at
> init time, and surfaces the result through both /proc/cpuinfo and
> hwprobe. Later patches can add RVA23S64, and backward RVA22 / RVA20
> detection, to riscv_set_isa_bases() without changes to the
> surrounding code.
>

Hi Guodong,

The series looks good to me. Thanks a lot for picking up this work!

drew
