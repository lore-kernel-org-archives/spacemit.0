Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AAF481FC0
	for <spacemit@lists.linux.dev>; Thu, 11 Jun 2026 20:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781211013; cv=none; b=b4DT/78tJ22wDtMuG2nlLOv4OxVYL45xsJvdIku4G7hLiScwov/eYV9W3gDfepXZmY+E6nrvF3mdcFF1rGGu3YJ1+nzDfjBsFKBgbxlk17OOLUvLrESiiuOY/nW26k7d8L7nstlFRov4TtOtgkuoFBg9ZdTeRqO0az2juBBvfyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781211013; c=relaxed/simple;
	bh=Mk4MD85wpIgW8gaPfr7INIh+M9eBh/sQU1QLVtpoaoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KmnpF386ol00oa+3F26lruLPvtolRS39MbXk5BQIPwEe61eDNVRf5aLpf6q+vBjBJMKAM6pDokfvHSc7VXmBzyAYa77kbSVJq6ntkBfWJXbrWa+MOnfsknZ/pRp8E6DGXnEHASNfkQkthOxaeEoWA0QfxNjkJi7/uEhQqYdS6Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b33fGFdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pczg7tGn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b33fGFdm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pczg7tGn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJEBe41400706
	for <spacemit@lists.linux.dev>; Thu, 11 Jun 2026 20:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7U12GqzKZ3dJsiu7QWLZpQE1
	HJAiLvJ1NIcLGrlb2b8=; b=b33fGFdmUmHrcWlfymGF3o/dulCmz3LRdm9ooGYr
	A74OgzAgDg/YYlewa5wd14Nlzi8BIlGZdEwQLu8DshZF2rFrVdHDjT79f50f+TrP
	6CbQOBykIMAXFDZTspCj7K/q8nPzO5C6xm2zOkOOttY8Ocny8Nv5Ng1PcefMWFHC
	Gb/Mk2sY4arsQ2Ky7NAQcahmI9qHgIhxy1jq4sCwmo58UWIXkNtFkeUwbd94VwL/
	nbuQRkMk+0/Wx/2RWCDCRUuYaa7NoIqiBSN4XSvQckfGYI1dhYmxEhusqZFO3tat
	ryxAxSA5vJsmH18JS/KiFRlhXVzh8vv1ZUqwq9/8xFcEzg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30g8bmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Thu, 11 Jun 2026 20:50:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304dd917645so599987eec.1
        for <spacemit@lists.linux.dev>; Thu, 11 Jun 2026 13:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781211010; x=1781815810; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7U12GqzKZ3dJsiu7QWLZpQE1HJAiLvJ1NIcLGrlb2b8=;
        b=Pczg7tGn+ks0R41t54RfngBM4P4M9MtKsmi1Ype9Lf2XyXkMACLHTjtox88RGHZLcN
         74dmLw91EKr0wHqJ1FuWbTHEwKft0tFvSSjtnZ52H8BGYd6/SRWa/sLJNBqNMSs8tCtA
         9Rl5VJr6c3X+jbCqTTajifiw1P1GECgbESZL66m5FxbXK7G2PQQ4jgBGOVJFRvZK3/8P
         vxNf+VzBzCJQUwylZeIdKUlAPIGS37A0DqUE9KnSbmVmS2CTyJU1XtHpxHVWrmJlKG0u
         5t/Ri+UVOP8x6vl4qjFT7WtxOWjtndF5ViGRKUlEiCWOf9rlvwUnBM5CmpYYRq2EsUuh
         eQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781211010; x=1781815810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7U12GqzKZ3dJsiu7QWLZpQE1HJAiLvJ1NIcLGrlb2b8=;
        b=ELUUe8Zj3jkeo2nQCWuQV8ngu/ZHFVe8fgmvua8qlE/FQGcm43MdvCz4Fm9hwAKFr+
         5VpVWultUQpKY9aEByL6tfl5nJk+9eOUPfqvKkjKutrWND7ikKmYFl7/NG1PsnpCIhZo
         2xC+K6xAiWVZgCbYwWMVxP+hU6WTbuf7ExJCjDKvA0GrJT6p6Z53hTTXDDrukmOlP2gq
         FpUNMKc2PJ8fF/Hud+gUxMnNc7x6qkdGchGLdzf28w9LJ0Ff8QGFe5iS3IUw7Pv0OuOP
         MkAV5GRFaMvrH+cRHnZJXtnpl1Mp3PGkiA1yDt510+dyvP/dzHu89dAEc2l7NpZ64Tfq
         jI1g==
X-Forwarded-Encrypted: i=1; AFNElJ9K7kZk5gvS2+kcjfNfnJb32kdGPGvb5LOv9Ny9Kxe0O+GvmrinyW3vWFP+qt6SarO+LT29TLJhSg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+WH5+Wa4O2dTcP60nNurTFPCiEXT9boFBeoYtKyD67adMmPNS
	yQoAzw/4fymFRwh0WSt6HuoNbRUFxDtCnvqIKBoPbaqV/LXqTZn8vbf1CgfEl0dg5MJLOtId+/4
	xiFksOY/KZVXfbxT5y2AY7LFfQJDlYLHPFOA448gAZ5edsrZMSS3gpzVc5xuMxQ==
X-Gm-Gg: Acq92OFflRIbdYxWiMeFSwk6FGBD1aYvDzFNxzdt5Qq4MCfcNYAmdmPRl6HH0Pgw+Y+
	aPS6Igfka7qyDKU/ndSMLuLnOpL9fnZdT35dFQgwlKfVeZOInxz0iPEeRjPUUh5mfARGQdd+V8c
	7CjrLe2ahzu7dHNOfeQb7o9xYympBQhuXcPFyGp1j/mI0U2ra3pS4W6bK407kC+qhucMeWzar97
	+AAjUtBEMH5+SQuh/SaM+SZi+fJ4Q3c0pC6jI24ZGTKteE54XXALgzZdKSSjcMn+F4CnRU3v6U9
	4LNrUgkR030CY+P80dlUcabS3n2Wlf99HhMze7OUXmRpLcr10EagJK4KxvyhCouYomYo7z68RPV
	dUNjMAVdDTN8KaK7CUMEF/PcXRW6n2Q==
X-Received: by 2002:a05:7300:1481:b0:2d9:6373:ad0a with SMTP id 5a478bee46e88-308047729dcmr3430155eec.11.1781211009843;
        Thu, 11 Jun 2026 13:50:09 -0700 (PDT)
X-Received: by 2002:a05:7300:1481:b0:2d9:6373:ad0a with SMTP id 5a478bee46e88-308047729dcmr3430111eec.11.1781211009350;
        Thu, 11 Jun 2026 13:50:09 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea4fe55sm303031eec.25.2026.06.11.13.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:50:08 -0700 (PDT)
Date: Thu, 11 Jun 2026 15:50:07 -0500
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
        Inochi Amaoto <inochiama@gmail.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Qingwei Hu <qingwei.hu@bytedance.com>
Subject: Re: [PATCH v4 09/16] riscv: Add Zic64b to cpufeature and hwprobe
Message-ID: <uttb7qknse5hk6suato3nelqatkrkoyo7r342pqay4wh6vyr4x@xestyyhoygtn>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
 <20260611-rva23u64-hwprobe-v2-v4-9-3f01a2449488@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-9-3f01a2449488@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwOSBTYWx0ZWRfX0tw5rLcPaQ8w
 IgG0dCPw8g8GFXx+s9/c7vYPUtbjwoO9NgV2b7iRgNiawkumyZrkm1oZ+T8n7wBNTGfeQIjulXb
 6zJBq2Oo47kT7VqqmP0zBGL7nxxBvbI=
X-Proofpoint-GUID: LGdCgyoo7p8pvE_TS9M_UQEWJcDEpoUe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwOSBTYWx0ZWRfX4+LvWM+RZMJ7
 JvrVZ7dsKzx2sRoV5zYJNG7gduX5bVcUo74z5CwNYSmX9pPfYmtK8E9VrhTxr5/Tr+EOffD7Bsa
 H/8QrRk3jjufR/8Vy+ZfC4SEYWnYNWgUbiW8WPXQU4WOYYZ2bWxi8qTLAIk80R77K624IKiUlHo
 k8MPXT7LZelFfR+IPAr0hZ5TlN1hHXUguNhqVaYXuJGDaNqkMFFjJGD1hjam8kKwJhCtWZRGphz
 sWw/QhB/Mb9w7V/ttOXfLXhf7a86VA2FDXH4ttI5Q3ooxGmzURbceYVA5a2NiEAglgaS+aXN4bV
 mlEkkflCqJnOwKtj+oOZ66k2//lGNhHPqtcKnQx2E7HbzmJdRHfqj9iCsOlBoKi2xqvFQAFD5xq
 jttjf5R6B70y4R92gr6gLQ1mLRwqlhjuaeMH6LIrYqXoOUiH15DbduwQJmcugmKPJ3NowFyPyH5
 z8oA1fvc0r0VtLAMDQw==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2b1f82 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=HwFc7jivAAAA:8 a=968KyxNXAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=acXkj6VtvC73PAOtBy8A:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=kr7TZk85JJIQSqC0cl8G:22
X-Proofpoint-ORIG-GUID: LGdCgyoo7p8pvE_TS9M_UQEWJcDEpoUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110209

On Thu, Jun 11, 2026 at 04:12:46PM -0400, Guodong Xu wrote:
> From: Qingwei Hu <qingwei.hu@bytedance.com>
> 
> Zic64b mandates 64-byte naturally aligned cache blocks and is a
> mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
> RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
> validate callback that requires each cbom/cbop/cboz cache block size to
> be 64 bytes when it is present, and export it through hwprobe.
> 
> Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
> Co-developed-by: Guodong Xu <docular.xu@gmail.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> ---
> v4:
> - Credit Qingwei Hu's earlier Zic64b cpufeature patch: set him as
>   author, with Co-developed-by (Guodong Xu).
> - Validate only the cbom/cbop/cboz block sizes that are present; Zic64b
>   does not imply the CMO extensions (Conor, Qingwei, Greg).
> - Add a Link: to Greg's confirmation on the tech-unprivileged list.
> - Add the missing blank line before the ZIC64B hwprobe.rst entry
>   (Andrew).
> - Did not carry Andrew Jones's v3 Reviewed-by: the validation was
>   rewritten (present block sizes only) and the patch is now authored by
>   Qingwei, so it warrants a fresh review.
> v3: New patch.
> ---
>  Documentation/arch/riscv/hwprobe.rst  |  4 ++++
>  arch/riscv/include/asm/hwcap.h        |  1 +
>  arch/riscv/include/uapi/asm/hwprobe.h |  1 +
>  arch/riscv/kernel/cpufeature.c        | 19 +++++++++++++++++++
>  arch/riscv/kernel/sys_hwprobe.c       |  1 +
>  5 files changed, 26 insertions(+)
>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
