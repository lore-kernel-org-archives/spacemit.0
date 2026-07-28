Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67CF3ACA70
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 12:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243262; cv=pass; b=J5bxwrop+2IbpXqp+ENUBF42O2eZI87vIN2sYvXiDZ98zvIJqjanHAQYcls9XJ3PmAUNknISC463S4TOp9nDj3J2UTVi/BBCFLTBHGXmHJXVk30jxOUaeVvcnSvDzrmcH69x6q7h+znFrGaUig//MjAhW8C+FdUl36OC8KFow6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243262; c=relaxed/simple;
	bh=b0sx0plN/+brXM6H07t6I9Q3Pcn6MIVpSqkOawHATLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3A853xTYKgCgxwHYj3PIEeIOu8ZClLaE1y1I0vzwsXCYO7s/9+Zu8ZffgqWtQ7znWi7Vltkfz42gqOEXC9kf6POMYtNh4kmiQNNvIGl6HSHjDufIT6Fn+z80JrG1axSzTxfzo0QnnGNPqZ0BrfvrT0YhSM/oCSZqQZfLH7nPAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuoFVeyr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WnewUXck; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuoFVeyr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WnewUXck"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHmTv2767203
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 12:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=2cawBiWQxfIarR0xDzJpp07gga51kPcOc4W3XKmecSg=; b=Gu
	oFVeyrj5q7qEfmAq9Ld9pF3nypwgyzdkuGSuoVTrliv1yNCHhZMtRTyw6zyxUXed
	t8JZrp7fZ4Usyenfy/Xmmfzzcauy0t9EvBjpfHflJsAUruSJ7i3Yd3Lwu6iJ87VT
	J8cUeEMAQv0iItVbW8kkoq58V8clS1/cXeexBCbcq/+hWo0xY4a9cMyRUEeUVADz
	aRRJaTgeyTHySUXMG5/VCYg4YbkxpYiN4HK+RNjr7WNgJg5k3t+iy0hEulHTBk2S
	/vgmHalkhe65yZjvFnEgTpanqwYpMzinT/iEHkpm32sdEqV9LrAzUDjMnujYjQHQ
	KeLaP8g/8L9ak2VswBtQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7junx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 12:54:19 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-668095be86aso9351784d50.0
        for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 05:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785243259; cv=none;
        d=google.com; s=arc-20260327;
        b=f87o1yvltT6bNNVxw6I8iUHnSpPip2dMN8O7GbBECH6qlj7nSO/eLYV7dQXqrVaZ1f
         7FwutwhA04aaaWdHq5hh5qvAAXcLB0dLL1aAY1CPJSoIR1hiCO+3qAcS7+VF1Pv3WBGG
         7c7WVtUkghWPukXfYIJjlWUfa3Gszfe+EhCYvR6MBr9INAp5XTQcPc9ryEEy9FBdNxk2
         N3+b3ztg6bbvvM4/b+ZPZZ1yIwoZmyiXVJ466raCRgyS56svpCvOh+0YqtDCSPsD2TBN
         A3cmzzf3vgzwpgbY9Np2w4//vvyU/vZ7GjwJJh9pL6/Nqt7drZ2WK45myw2a96zAkj6I
         /qhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=2cawBiWQxfIarR0xDzJpp07gga51kPcOc4W3XKmecSg=;
        fh=v0PBqjKrcL1JlRtJFGCrK8t7CBacA/a10jSh2pC/6PY=;
        b=YwLrgTb3MXS/eqd0i6oOeg+rIhxVEeQeo3lN0STOkD35fRQ9VjyCet90j7NcectZ+e
         wF1jTX8ma/83u6vn+T+eI7AuMQdYb0irQvtDGu9MynOReYBodwK0OMylY0m5QY9hmBuu
         Gr3m3dsDpahmVhu5xiRcHjDUb5QE99TOsXqKmXpPsIgUadrTMZmKYoeu4dN763iOa1Q5
         Pe7MqVhdaOE2+omjHhr8rxgCW5NHf3LPFZt8MySvPSyZYi05+TENaTUJ6UZmtoDalKwz
         0ukPaOYhbYpczCeUljJP5Hk8S/QNi3df3owKBGz7cAVQRAkU47erGiZ+BylFTC2zqTEr
         rwrQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785243259; x=1785848059; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2cawBiWQxfIarR0xDzJpp07gga51kPcOc4W3XKmecSg=;
        b=WnewUXck91E/8S8Fc28lD9qnTMYVrF+VwaHFRsqMArHZbWE7mwVNjiVg8brjs/v3J9
         d6ezB+0+VUZygF1kS+u31A8+k0yH35BcL2Nb82HsjoTwYCGcCWVKgo8YhHYcW1NYyB8l
         v3JLILx3Lf0q2zoeQNy40g5EFPKIiH9yE4ReyZTUeW5+yptOoUjob8C/ygzxgVaJ92ku
         0O6GGDUrSfWUQs4/HaK9Gxd8ZEf50GbesMe4l7vWeNnelw4TPwjApxI8Gv1QnIbJ9ZXG
         FyrX4bEVN6pbn1KSpCtTNe1ykAR5O549tT5GFy4j+GcnKktXwo+58GMod1ucp+RMZzGB
         ox5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785243259; x=1785848059;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2cawBiWQxfIarR0xDzJpp07gga51kPcOc4W3XKmecSg=;
        b=qZtczGWkPNKLFaOLprWw4wbnhkYcmARJHQ10MP31Iw4DnLhcafJIgP3otIYAVVWgDc
         J2iyjD93TQDclFlUARMQTIz86YadRHHkfNpz/3s+kDeKJdzs/+ZAN/yRg0pUkY4xwdx3
         UwJw6xQ7jSLXv+r6pgjyR0D13DtO/IOdXWF3kDMSCcDtBBCkYZwEMoUgR2ImnX0vy9b1
         z3mWa/fHakVP30caC8OsQgLgvsRHIiGZhN1cBtoa5tYt82IsHJkZph8hfAogaJXNv7zc
         KxQ/3M8VeQiJccAWnGhScyZPplpDwbh/4KX+O8sanKnfXjy5I4YJxBOUQFpNUqU6JO5V
         J4bA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4U1/sdefxWmLvksMpFjMhhDMHSIU9iPSNs8+X9VX4DywCkhnLBeG5RSI+zVyskHpKL7VSuXmWdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl8ZcHf7mKF1nrdqzr1z6ZOXIpRJ4DSifU7bH8Nd4wbb7zXGub
	XRfK3R2FjzOTjAL8pDUa6dYOQ4SZQWtPjusa6jicgDPfVmHS63+b4cMvgFbfxOpDzcN96mN4lRb
	UQQePDGmDluQ+V1lS1cYOVNFLmUBHa1jtBee59NpLLdQrpGwhu+n20BrrklWSSU3QxT8RYlOWCh
	eLInGWb231GON/MXwZArunoD27//tkGiLOhMQ3
X-Gm-Gg: AR+sD1043L3F2wwn56RxTLJAWu8cVGvx5/h7WVP+FxWxwdkTyXr2olXqEoaL0klMgDE
	aiM0Ksvaqea/09zsuHPc0hEd+mHGFSEwHEsOSX9V+LUMsWF6s2VUKwGlgccVs8JInUi/OM4xwOv
	D8Emq31ORxnn82TxXpBEDrrU8F7oP34koDizT7N4nWKyCFidA4apoTTh6ZFg==
X-Received: by 2002:a05:690e:4395:b0:668:1c09:aef1 with SMTP id 956f58d0204a3-669054c30c9mr601986d50.6.1785243259005;
        Tue, 28 Jul 2026 05:54:19 -0700 (PDT)
X-Received: by 2002:a05:690e:4395:b0:668:1c09:aef1 with SMTP id
 956f58d0204a3-669054c30c9mr601973d50.6.1785243258645; Tue, 28 Jul 2026
 05:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728-riscv-acpi-lpi-timer-v2-1-5a30e0021ec9@linux.spacemit.com>
In-Reply-To: <20260728-riscv-acpi-lpi-timer-v2-1-5a30e0021ec9@linux.spacemit.com>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:24:06 +0530
X-Gm-Features: AUfX_mwIyP8SKtHFksxOpexuAlrA0_ifqJrmlt19_-9C5OcL2egVfaB2UDApqMo
Message-ID: <CAB19ukH1Srbw+Yko_-21DiV7Wc0ysJX9cmE7xDTwtrmUm_5rMw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: acpi: Handle LPI architectural context loss flags
To: Peixin Xie <peixin.xie@linux.spacemit.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Yixun Lan <dlan@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>,
        Oza Pawandeep <quic_poza@quicinc.com>, Will Deacon <will@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDExNCBTYWx0ZWRfX6/x3laM7lx5A
 +TY6lbRPgR2FpOnbyVzEJptS3EcLiYTRrstrAwu//y7ixFBYAndHT4Znant/okjcmUuMPkY45oN
 FYmVFLW6F1tkWwAbAuS8L/FyN/n4hFgpUxRXnbFnbWeDwvvcApdIW1yiPteXKSsMgHZ5vZM+lSf
 l2DUabL6CPnmQi4qbauc3gDdR/IE9AbY6Z0Sl/oZbnA+sAixByaA7e1inobkZDLnOgINtClyWOt
 6xSQwHcFe4TJ0EMq1q6+OWDJuuOXFnpa2b2lT99WagbvCw6fyprn8Jpy0gKXV/4nfYXEIHembN2
 iH5WwyLLmTahDwomQPYOQ7/62d0e96vYCh6i3b4PT8nk0dr2f1WgFdXY8N3cA2Wlqv6ad2pCGlx
 mEWjZYoF5YoHkaJlHnY895Zusl6nRiXId77b/5UtXtc3Wl1S51SRSzX01Q/xzPtmWYQpk20ivl3
 Fh5OA5Z+dvlfllGJ1iw==
X-Proofpoint-ORIG-GUID: 4KLE_hnEEVyytt5y-yfUkIkBWFh0da_9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDExNCBTYWx0ZWRfX5m40W0Vo1wf/
 A0xnywPxDPbAMqIEHjsorfPMSSqHeuvrKwMWGK4CRGk38ZS2GvliSxN7PcuqQlk6hwo06LBxMz0
 c2Ls4u46olSMcpLuhA23ulwvNEcXfAo=
X-Proofpoint-GUID: 4KLE_hnEEVyytt5y-yfUkIkBWFh0da_9
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a68a67b cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8 a=lv0vYI88AAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YoT47lCsnKj-Z75T7f8A:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22 a=FO4_E8m0qiDe52t0p3_H:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280114

On Tue, Jul 28, 2026 at 5:24=E2=80=AFPM Peixin Xie
<peixin.xie@linux.spacemit.com> wrote:
>
> Commit 4785aa802853 ("cpuidle, ACPI: Evaluate LPI arch_flags for
> broadcast timer") replaced the generic nonzero check for LPI
> architectural context loss flags with arch_get_idle_state_flags().
> RISC-V does not implement the helper, so it falls back to the stub
> that returns 0. Consequently, CPUIDLE_FLAG_TIMER_STOP is not set when
> an LPI state loses the hart timer context, preventing cpuidle from
> using a broadcast timer for that state.
>
> Implement the RISC-V helper and map the hart timer context loss flag
> to CPUIDLE_FLAG_TIMER_STOP.
>
> Fixes: 4785aa802853 ("cpuidle, ACPI: Evaluate LPI arch_flags for broadcas=
t timer")
> Cc: stable@vger.kernel.org
> Acked-by: Sudeep Holla <sudeep.holla@kernel.org>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Peixin Xie <peixin.xie@linux.spacemit.com>
> ---
> Changes in v2:
> - Correct the FFH specification reference to Chapter 2.1.1.2,
>   Table 3, as suggested by Yixun.
> - Link to v1: https://patch.msgid.link/20260728-riscv-acpi-lpi-timer-v1-1=
-c722bce01e48@linux.spacemit.com
> ---
>  arch/riscv/include/asm/acpi.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.=
h
> index 26ab37c171bc..2643e28fc08c 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -12,6 +12,8 @@
>  #ifndef _ASM_ACPI_H
>  #define _ASM_ACPI_H
>
> +#include <linux/cpuidle.h>
> +
>  /* Basic configuration for ACPI */
>  #ifdef CONFIG_ACPI
>
> @@ -67,6 +69,23 @@ int acpi_get_riscv_isa(struct acpi_table_header *table=
,
>
>  void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_=
size,
>                              u32 *cboz_size, u32 *cbop_size);
> +
> +/*
> + * RISC-V Functional Fixed Hardware Specification Version v1.0.1,
> + * Chapter 2.1.1.2. Arch. Context Lost Flags, Table 3
>
Isn't it Chapter 3.1.2, Table 4?

> + */
> +#define RISCV_LPI_HART_TIMER_CTXT_LOST         BIT(0)
> +
> +static inline unsigned int arch_get_idle_state_flags(u32 arch_flags)
> +{
> +       if (arch_flags & RISCV_LPI_HART_TIMER_CTXT_LOST)
> +               return CPUIDLE_FLAG_TIMER_STOP;
> +
> +       return 0;
> +}
> +
> +#define arch_get_idle_state_flags arch_get_idle_state_flags
> +
Otherwise, LGTM.

Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
