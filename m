Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9CE374E7F
	for <spacemit@lists.linux.dev>; Fri,  7 Aug 2026 02:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786069514; cv=none; b=Xf5fuC1rSnbcPfOw2CgFcW/l5qbuFtc73PO8CKdcNFHcvb7BikrCGNfJczC/gK129DFDITcESw03CA3XM0cwdwmuae9w5tSLN0RchYE+6Z5KhStvDaSxm0DudVRdIatgIZjPPwssCi9bVMFi0Xi9cn6k8vjX0DTq7e8G6JuETno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786069514; c=relaxed/simple;
	bh=8jBKMNYB0eUETlc8evzGy3eZ9r0JV0X/gI3eEmEgJws=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NoONCpkr52hs79HXamLDE5LDz/N0RmV0a0DkiEhTGi3f0ZEuidM7gTpM1jNZLZnkn0ROPmufWo9bgyLm8SIutrBZsUT2r0SCegdKy63Dgk7CfHVlXuw73L5SD3K2OGCpBvTseG7t0lRvHnlqJvP04JKxILt1zad4z+X2DrUuaGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeNbwbjO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ET3NmcjX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeNbwbjO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ET3NmcjX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770HBkk2803493
	for <spacemit@lists.linux.dev>; Fri, 7 Aug 2026 02:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sME6dxu+lP6XRSMrnAXeehDIBxuMJDmF4YYzKVgdqY8=; b=GeNbwbjO1fbnzb5t
	aR2/MyUqbNyATdthNed42sBhG2Tjl5Ie8RzmWkY5rKqcw+7O2hoo7zJjiIpscMEF
	w7Eej5wjbVLP6QHh4MiYOPDX2RrIeyuz4dznxS4OWBtOYeOwi6DwZJkObJK2NE62
	8PogpSC2dRM+2SJp13jUINMPPHCWw7UtB+gz9ndEzy/PLF3VtiqjNagm291VA6gL
	VccoHR2TlXOxZBRsvJmGBEAxtB1kpstoZo9tfOBRXpsCibRi3hdx7J6GJzwEGijm
	nqiXoCABnCWoKYgVfDsjgBb3Pe3Nd5gLjmcZVXe/vV8OKZQYlZ+llynFxTgcs8gx
	cPmmCg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hsqww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Fri, 07 Aug 2026 02:25:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bec738909so28762551cf.1
        for <spacemit@lists.linux.dev>; Thu, 06 Aug 2026 19:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786069512; x=1786674312; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sME6dxu+lP6XRSMrnAXeehDIBxuMJDmF4YYzKVgdqY8=;
        b=ET3NmcjX0NiUgBOaNomT2Pn01uDg+QiilA8p39AgxU0krMcJ8u739TQj21NRAh/9/e
         2j7bRDuMXjhqX+KGftTfFgiMEVrvVFHBwJLHsKADok6IUWz5wZ4XcbkK7rIG+Bc5zBpt
         cSy0+RZ6X7/sZdRY0pkp1M6Wg7nu1L/75JIxBPIEUTFwbKJX3lO0ETbVs7nVv4eTrQxC
         p0+hUeXmW1VGg3pE0ZW3wXswFyiwcqEXrvD6NDM9r5Pf3s4eUChK4ydKeoaeFJCZqxTH
         jtDAuP5nEGF1thm/9WUNwQAnmeq8u9LzwC/Gl6Tp/UhFMDtqMHHuZ9+g2xqyF2z51vDQ
         /haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786069512; x=1786674312;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sME6dxu+lP6XRSMrnAXeehDIBxuMJDmF4YYzKVgdqY8=;
        b=iJuhLlo1i3m3i0GJkVOEZoXCtEldTG9kIoyl6TR8SKMnvx9ZyJqzaC8Nr7hHKFSBBc
         Q6EMsee3yAilS3L7EWA3UEJp6ywF81A/vYyLbK3mNppUXI2eLli0sPBhcpu3TUFMvtBI
         mjwIKV79JUAEuSm+7A2T/N7gF4siofPJ2hwZ87vSAeOg+z6MIAyTtT3tMEN7kx4/HV+k
         PTPbKBfQ3Xj+5MnYo0NI1l6kIXaPrj5BLJtpCdCyrUhS3UCoyL8mMckB0JrEizmA2zlT
         IqaGlrGWRKXs1zmgskaub2ydCXNfpEcVNiPIK2EoLlCoTOwxmojp9cxdUac19NcQuzFR
         PTxw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/wfUzvy656yFAxfB5JbfR4RErI+plvJKsPp0GeRods/7BS4XHSC+/KI8qYc3LkDjnsGJp8MLMEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyH9Hz52w8C03EtIRoJBwSbo5XePUjqlveEZJsz9K9DhyqPd9qE
	aRE4mkpQfBgNH2DGznWYzdpi1NzAcwNKL9qS/Fv8TvcHGLDatxOmfRYeZscHRoIkg86LSELuiyf
	Kez7tNGNPS3swh8tdBMA0vHZCvz7ZGiMx+TPjDTuKNujxlHLpwRglgAmQZa+ZAQ==
X-Gm-Gg: AR+sD12exc2eYtnDP009MJabrmauXVPkGaFMBAeni0WUx9IDqD+Iy55hjNAy1QbMmTo
	J0mBEz3//wQcCytBytEjco9ABqMt/oM3MM0sxmlbfKryr2Nw75LYQSg4kXlfM3OxXIACUJYqdD+
	X4NhSvP/CU5He+8m+tKG2wVJdzmUG3i9YhzZVw7HLIN2ppuwbTXUKgWr0zE7XA44IC0IVMhnQen
	pc+/TRexOuLxFDg8S/dFaeT5lAGo8NMn2NXYN+stJenCCionb/WeJw/qJSHLr8XgSdFPUtGol/o
	5Z5chAdoQm/j4L7DU3ZNkniPMd8Nn6zdkTY+dJGQE7DzTXE2RmvkqHiq2Q3vJiPDYD1HTFv1pX1
	4QGDABQF5d+lniQ/EnAkKSe/MgpXywfUu5QQI43WlrAHhjA==
X-Received: by 2002:ac8:7f85:0:b0:51c:1967:5091 with SMTP id d75a77b69052e-52ce6200bcbmr210648551cf.41.1786069511714;
        Thu, 06 Aug 2026 19:25:11 -0700 (PDT)
X-Received: by 2002:ac8:7f85:0:b0:51c:1967:5091 with SMTP id d75a77b69052e-52ce6200bcbmr210648191cf.41.1786069511316;
        Thu, 06 Aug 2026 19:25:11 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995420bd1csm108881935e9.3.2026.08.06.19.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 19:25:10 -0700 (PDT)
Message-ID: <0f8f7fb1-1138-42fd-b949-19e32e61917a@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 04:25:04 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] thermal: spacemit: k1: add shutdown action and reorder
 registration order
To: Pei Xiao <xiaopei01@kylinos.cn>, shuwei.wu@mailbox.org,
        troy.mitchell@linux.spacemit.com, rafael@kernel.org,
        linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
        dlan@kernel.org, daniel.lezcano@kernel.org
References: <1967d2bcc8fede6fbd25fc8eee07f2873fb41472.1784184867.git.xiaopei01@kylinos.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <1967d2bcc8fede6fbd25fc8eee07f2873fb41472.1784184867.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -uxj687CKFPR35H9M5yQRgPqfPvtlGX0
X-Proofpoint-ORIG-GUID: -uxj687CKFPR35H9M5yQRgPqfPvtlGX0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAxNCBTYWx0ZWRfX7ZpchTFYTMTQ
 SX5f1r5Zne9pQlomXcyujmPKLJA0xUjOsz7vYyjvunEYTLm3M26S7+YT9AKe+Tr29YqXzqRKSr9
 UVNtzmQ8Nx5E10mIWSJf1d5i+iQ02v6SX8/0F3r3ZSq/euOM1y4ROhwTDSewUyMOREfpztTVFq0
 QJ+8jadFawTHP1VA1CXImbsUfwfg5g6qvo1jBhjEiqMiwdbAHn2dV4jk9X0UDLCYbtIAaH1Vwfm
 pxdFYOatkR/MbK5+ApvYywWz5PMzXaTEfSoiiXzTONu7Zxmrh7wSxBUC2Wsoz68zwSbeKlCQgwc
 6j/bbqe0tdsLkL3+yVZQmQohk1jV+b+BsNtLJEMq9i2vRFy2ubbKV0+01U9xYMwRXhMBNav7ykn
 qZGE56V2B5iQmtISt9X9XX+RFxdVoppnNZVSk7Jq8qguDlKHd0ZRtROLvVi1E0FYcE7gU1cmD00
 u9AtaxxgkGRiV4F96ig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAxNCBTYWx0ZWRfXxUbt89P/wUx9
 65Q1/8EOx89c7LVkToAf4h6jyCWQWZQHJw36wzTOk1sUDpHvlhTp+Uj0kzbnadeDXHZwBbDYFZv
 JnQHhzHfR6iNUYgHgZsytmDe8Y5ng0s=
X-Authority-Analysis: v=2.4 cv=bot8wkai c=1 sm=1 tr=0 ts=6a754208 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c8bhSAXnGUngXy6NwXgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070014

On 7/16/26 09:04, Pei Xiao wrote:
> Add a devm action to clean hardware interrupts, sampling, and control
> registers on driver unbind, mirroring what k1_tsensor_init() sets up.
> 
> Reorder the registration order within probe(): register the thermal
> zones first, then request the IRQ, and register the shutdown action
> last.  On removal, the hardware interrupt is disabled first, then the
> IRQ is released, and finally the thermal zones are released.  This
> avoids the IRQ thread accessing an already unregistered thermal zone
> during devres cleanup.
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---

Applied, thanks

