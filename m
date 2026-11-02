Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605395;
	b=Vng6w0xt43FBBL53jXa3ngHrrJF5RzvN8ByBZPuUReRwrJwCWjgYfGsZqswQ6uCAHXgc
	 iL2a/8s9JNa8devIP7QrSs2LtgVS7mSYcKl076GHZzTPSRfYaivuWdf17lH40jdp6NEZR
	 RBOD9Fmzv9/sByUZW6EKPCIQsy6mNcJrydaD/a2lNn/76OxEnKKnBUz/Yd+8bThctVC4R
	 rMMrAAExgnXfSOZWakyI3TOWzS9Sm4ghHIw82FJp624f8iy+AIPN10/WREmuBPBM0v1Kv
	 nUNs09deR6NH8YcxEQRc06nIFYSfFfl9eutdUTX5Tqm8PysQGj/6eOwAP9hazsz1tMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=klOv1N84yVFiX5VyeIBQfSwBuik5rDbfaMDuPGgQBP8=;
	b=bbA1pg5fnbARqpRiEecYXPOAJeIyR7Sjw107qw9nlQDvNKwTQtLfO3QAsgIzQ+DjPCaA
	 mf4y7Gh9IUK3VWfqPYRNNQbKb6Zawp282tsNUmzdgOLnIhvIyFYKqUDXgFmpHmxZ0DumU
	 5ruH/P0kySIfCNKNNRIxDrr+Qh2KMJdY1ga3yFB1d6GHE7oHNkqh32uXmEVNusvUkbcFn
	 uTtl9YeBotWaSvMbXwNI+oV/cTRfuzkaFE4WNd47bAAlbF7FzL5zepYwmfhvPzcDpTLZC
	 518cJ0ObzIAGVLza/ojFDXsfzcmzfjmR+XwPfebLNwkWfCxfMm6SbRl3VXgO+n0SwZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Otw4bcgG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RFOhdnXW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8071606A327
	for <spacemit@lists.linux.dev>; Mon,  2 Nov 2026 07:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8071606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Otw4bcgG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RFOhdnXW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vFGx3348776
	for <spacemit@lists.linux.dev>; Mon, 2 Nov 2026 07:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	klOv1N84yVFiX5VyeIBQfSwBuik5rDbfaMDuPGgQBP8=; b=Otw4bcgGn2SZvAAU
	SHiX5S9Rrnm3QRUvZgrsRrqaD1dQiFSlL6Md4O+n4J4OGWK5rdgqDryMx/ELO3o9
	XR2WZjLrBBBBT+XfyZi2JUlFaOkcZFTcMnIirfWcxJ1gx1u7d1dEJCtVS4f2vl0q
	V4JDx9bri+DEGBQ25AaMFinqdsyFdOtaaABhZ56xYF5mpOgBkJM9Z2CgbBpcEBsX
	Oe5llLh5WSVoaj/VW1LSKDHpP/+Q8VOLXwrDkVpMXR8btuMadadyEdw/PwnqDFeQ
	n8KbV2HD7uzE5n6SLGqsl/i50c4wroRDDp3Vgls+M+01/nSjtv46kjeJyHRGqUV5
	mvmKFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxnsmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Mon, 02 Nov 2026 07:43:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so441778585a.1
        for <spacemit@lists.linux.dev>; Sun, 01 Nov 2026 23:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793605393; x=1794210193; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=klOv1N84yVFiX5VyeIBQfSwBuik5rDbfaMDuPGgQBP8=;
        b=RFOhdnXWyPpisQHEOpi53ObGXU9XIPZz6Ydsk3hj8PpzXjhUwFKEkPpzPJRAXwY+NC
         NPi8o2AOqZ2Mt9Ck7K708BB/W/gDj2lCXM9s+OkTlxcWkWW/fqDfJMBrTqE94IsE3l0P
         2V9+06RvqA6GNiBdPJYYt0OaZSj8EgUEyEZ6SDu4WbSZ9Umk3WwIahzODxfB3JmOtp0Q
         kk7EYaBWfqFz6xH2gbb2C3lVte9fxRVOlXD20PyAxysk+Qa6R2SeLT6bPlXrjkqutnvn
         reSEMpYpaPW5U3lKQoZbK9Ji6S8vaTsKvuDsTatZbZhx3KukJwGqIWvpUAbBPCMkIGVc
         pl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605393; x=1794210193;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klOv1N84yVFiX5VyeIBQfSwBuik5rDbfaMDuPGgQBP8=;
        b=mkeLA4y8wUCwwh602lw3gTw9DIlWxMJx8d/XcITjvk56K2FibfN2sr2YvbADt3uax+
         75p8hM3P15rvd4EGQ7mr2CGLy1Ho8yhIPEETxYfWhcbWbkhLmEiUoVhD/B9ph1XpcLUv
         oDytrgB9x04yV7YbCf+aYFMKBx/qNqCKUnW0afCzxVjzbWldtjjE9CLg2pc0FiCYGWfo
         2EvDamo3scX+7YzMDOuM/+elVEbcAs7/Xk8QW2TZXuvIL5mTyrGvuULF36CiRwWdumwX
         8LO20yaKEeQmYDt9mENzE7vn4/ikkLuJvesjMiToeARquPRCoa/EU7H9caiVyOWFSP4U
         BJUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlTCE+2bs/o9Ieq/yEpSD7mdqU8Dz1yyozjPcB54L2Pgk1/h74ay+c+LJfbkYBQf3sh8pwOXEPYQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLJ2w680Lst8efQ1hDKU3FgKIhnsum/n+YU7GGQNz5CoC/eMKnc
	S1bivBzd2iZ2W/ztS0aNV2xvldHY96642BkE2MHc42jef2pI89APS3NvptOWP5stmcXR5lDsIfn
	0tslgb5wRitiDvIe3NBHn0hmsqgMrmzld5CVaEG6zimaCBdcLFma7u1OhS/7/0w==
X-Gm-Gg: AYBFou2jtCs9qXoKInSoJzDBHSZyUfZbZdfRO0oRDoVnGaidqYBGkN6lnk6OQrYc0Kw
	OD99yIOiOPHl8iY0b3YJGIZavcfbr4jMyqduUEqpxlfCNmgi74laia/p28o4RtPZNL6ZS0Gw7sF
	NRnPDYVr2GJQPf0wrUlUpPdrf9oGDdXet39XShgJ/cNDeDKTtmk05pXpFF8ZbHx86bGb9Gyh5JY
	4or2TNC5/xRm2F+75FRzm5fyZ+lyt0pHzvffikW6MS/oPTFdMpPdRlheGxR+3f0OuyuII3GoOr8
	RGYykBFW9p9BU2P57viBA/OWcXGFFBaqdbayCtgseDSIHYtGE7sCVaXY47XQ6SOau781EHLAQ9N
	uJDdndxtRTgzhi7ICM7zwsMpoq8KVjXQytQqCuyqUFXnI2MZbf5gZNe8R2XwcxocqSuMeczqFcA
	==
X-Received: by 2002:a05:620a:29d4:b0:93f:3cb0:464b with SMTP id af79cd13be357-944216f1ff6mr1455248685a.49.1793605392608;
        Sun, 01 Nov 2026 23:43:12 -0800 (PST)
X-Received: by 2002:a05:620a:29d4:b0:93f:3cb0:464b with SMTP id af79cd13be357-944216f1ff6mr1455245285a.49.1793605392157;
        Sun, 01 Nov 2026 23:43:12 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm18976337f8f.12.2026.11.01.23.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 23:43:11 -0800 (PST)
Message-ID: <151dfde0-4057-4ace-88f3-3939612e4dde@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 08:43:08 +0100
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] Add UFS Host driver support for SpacemiT K3 SoC
To: Trevor Gamblin <tgamblin@baylibre.com>, Yixun Lan <dlan@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman
 <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, "Martin K. Petersen" <mkp@kernel.org>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Jennifer Berringer <jberring@redhat.com>, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20261002-08-k3-ufs-support-v7-0-bb39007ff9ae@kernel.org>
 <DMICF1DA617T.1TZ7DMV5WG818@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DMICF1DA617T.1TZ7DMV5WG818@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J4mmWO22htXXRe-nG6qeDHyNEi-ZMiGw
X-Proofpoint-ORIG-GUID: J4mmWO22htXXRe-nG6qeDHyNEi-ZMiGw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMCBTYWx0ZWRfX6quNKjXYBr7A
 PO1wslxuN2bw5ZTNJRgookctcLbGE8yrj3itMfjZNx72zydEj/YjguW3Et67NUaC4mGlwQxJZKg
 QR4aU0sz5vUnn+QlNu9qJdg+vO9xv9o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMCBTYWx0ZWRfXzOJXe8uXPgsT
 RitKZp/2AJ3fytX7LQpu0iX/IQA7NI4Pm2wEJFKVvTfAtG53EYF67a1FQ3yxxxJtj6g3Cn8WtVo
 oYqWIiJ5AE7h9M2Ct3bH/ShyvjbFjDIfD2tv+kig/otGeZmybu1FhwbsIYll7h9CwnACrmOGy4Z
 ycUDlvVMemNI9qQOyXQbuyY2jfwQwiX3/LM/MluEov91xZEYPgkZbgRdDf7xm9QF80xXpN4nj8T
 qRtHg8SMA2x8Xc6U9JFeh2RjMqS7EGFlPus9pX5VKHF5pMDs61CJMGKhyTD5jRoyowqWf+Lg5Ow
 xhITHXWqBU77nx9ha8d1MCiiYWAOInYiCHA/1PV6TfnBfotu/SQwHg2mauMSc9+ryjyc2wq4GpK
 2x55+dHblBCDZ0sYbIdX4Q2UlnvQ8o4PQCK+9EYrJmSc75smtvOlFrPdVHPMATgAttUgakv4oBa
 zLtAl4/Y9USSdiU8yVg==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae83f11 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=IpJZQVW2AAAA:8 a=T2WrtOQxrTuvjP7BPBsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020030

On 30/10/2026 18:19, Trevor Gamblin wrote:
> On Thu Oct 1, 2026 at 11:10 PM EDT, Yixun Lan wrote:
>> This series try to add UFS support for SpacemiT K3 SoC, the controller
>> components consists of System Bus Interface Unit, UFS Host Controller
>> Interface, UFS Transport Protocol Layer, UFS Host Registers, Device
>> Management Entity (DME), Transport Layer, Network Layer, Data Link
>> Layer, PHY Adapter Layer, and M-PHY Interface. A more detail functional
>> block diagram can be found in SpacemiT website, chapter 9.7.3 [1]
>>
>> The DTS patch has been dropped in this series [2], and will send
>> in separate series once this patch accepted. For people who want to
>> test UFS driver, please grab the DT patch from version v5 [3].
> 
> Hi,
> 
> I've been testing this series (and the DT patch from v5) successfully using a
> v7.3 kernel in Yocto's meta-riscv layer. It's been working well with fastboot
> flash in our nightly CI. An example:
> 
> https://forgejo.baylibre.com/tgamblin/boardgarden/actions/runs/827/jobs/9/attempt/1
> 
> For both patches:
> 
> Tested-by: Trevor Gamblin <tgamblin@baylibre.com>

No, you cannot test a binding. Otherwise explain me how did you execute
it on the device?

So if tag does not apply to 50% of patches here, why you can't just add
it to the ONE single patch where it applies?

Best regards,
Krzysztof
