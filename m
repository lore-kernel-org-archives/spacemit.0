Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5724A3AA4EF
	for <spacemit@lists.linux.dev>; Sun, 13 Sep 2026 18:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323913; cv=none; b=LWeCU6vd68gh1d6LXovm1P+eWq0hq/MXMQpoCLl2tKzVGPu6WJtqyUiQSrEMkTP5f9wdNXR5MYivTF7Q3sExvtPVHVzjNHNQfNV5DKAmKQyqvNsAq0HQqUGKLAOfQ/b2IMPJxJRzyHUSrUxWz8vP04bTVVoVM7mXaoLRxhqqxlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323913; c=relaxed/simple;
	bh=Oua4x0xBd8TZMilI1qAPMvSZRZQ82sr3amusq4fS9Bo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qc49Nch3wpdPE9FlR26EOOXo3ac85LjnQyMKwp2IcNKqNDlmLm83Rnln58+NTZWxJSf632eEzKgRYMeuFPvKWFLY/8gZTlZy3JrtpR6cAy48SbKYlALpWSRcHdQ36HWFcXxIGpphvuk0TcbBwYpTSGXqPWuHt6fa55087Tohsxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJB0+VLI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRiv3z1C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJB0+VLI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRiv3z1C"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2beV2450902
	for <spacemit@lists.linux.dev>; Sun, 13 Sep 2026 18:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GkLKYhzdmWx8ASPEw+bfyEGrvJszZcX0ihy3/m9xYe4=; b=KJB0+VLID+cSRmJc
	EIWHRn+VH954/zglrkOFq0tU03iOMtCk3ZmbQ1nHHCR7xGASsfHWNfQzFHb6SL8F
	hB3ePZ9kXc70wJrEGbmCVFCaTZxBtAWG9i+7hs/u4fTdvL7KmApI8X6QgmazBr21
	XFrx8wSTeIMym88Phf2iEdH/oPL/dSa/JBqgjxS3IyII/CBoFp5JGZ74Et9K3lgw
	rorHUMAZYOvgZ1fSFTdMKjSjX4cn0XaH9S/qLAaEMuW9JF3ufYY3whAgKr9Im115
	er5/s5kUXytHDQdXAOqKKibQnyFR2fLZGvu6YZmoPcODjCylab61rPc68nsMLyFJ
	8FSXRg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d3v8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Sun, 13 Sep 2026 18:25:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so2029215a12.0
        for <spacemit@lists.linux.dev>; Sun, 13 Sep 2026 11:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789323911; x=1789928711; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GkLKYhzdmWx8ASPEw+bfyEGrvJszZcX0ihy3/m9xYe4=;
        b=RRiv3z1CCxhv3PiIPvY3yvKGqgKSgKortxxq30XvwQ/D/Jbr3IzZK7OAqUxEmcdvtC
         wmgtAQCuvXl8O6c2TOo+UIRUr3cOdFn912Dd/0FfEO+MZ03O4eFOWYR7d5i/qsuc0UKg
         7C1KGk/NKpXclp4mlBd7IVbaZhsifziX1p4me2USQehOAmeGGTl/I0QOWUSU+FaQ9sbC
         vpoayYMMd9POvzTFCqnScEnfADiQgnJDIXAPSi1qzT2hTV5WL0pmNcF4PrJKbTnrVUpy
         ls8MDC993J3KDc29GIkX8Zp5GJ24Y/62RXpRWxgBuQvnc7n7rObAaSbvvhhCFEFx7Ext
         hofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789323911; x=1789928711;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkLKYhzdmWx8ASPEw+bfyEGrvJszZcX0ihy3/m9xYe4=;
        b=Ir3Z03QGDgMFPDLh5CQWTR+UxZZxQywqh2Ba8TuHPdClPuPnzX6TrkcQ4+AdoFuKPQ
         rReJ9fcOm+eY22hwmrl7D4UUa+9mEstas+aeO9c8sS/G0daxYzLqoYVwcwKFLWKIgEKS
         3rfiY8HjaewIy5bGaAeDgUcyejToq1fQFHgzT3w7nEiyw27FjJm3L8PKRzHWAKsV2FL3
         kVHg+HwcEL3Svq6rCP3gLzX4j0e5+/dZ7r+psrO6fj0bEVV5a/0aFvPqH7tmMw4Cd1Y1
         hO1dMjPyrwES8AoJClYXdhOq7rLVb0dG4PbMKeS4lguKpY+r+ZxlsXAFLjwSd9Th6yzV
         BrhA==
X-Forwarded-Encrypted: i=1; AKwUvBxkDtKoSXcTZk2V1KPYLd9VA1aBlZSN34BXdBwBGav2yDuni4OZ5g/czmvbB0CwAPBd991JOLZ3cQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mHchP/1yMf5gsPJCCWvJK5yqHpeEZf7O2UrvLxPdO6bS2l87rx
	fYuIOtI0kNSimiNayNWE2TqwMqGjt+xrXcBzz8QTzyDADY92QeKKB1D/BdqHuMyZybavsKlWWhR
	4vesGvlziOiDJWyXc4aokb9bZXRRWpWa/fO6Csp7i7iPQTS5SLKZyVnLaXaMfWA==
X-Gm-Gg: AYBFou1yypJnSLA0Nx554LiFXZJH5TBj1fOWjEQGMMY1eAATuqgq09zVo3y0zUIlYnS
	e0wG7BPvOWEySG325RzfhZLV7BqVaGfB1SPeb8Wd+WuL6XjqK4S89wUNYSDkrTUYmNFf+/Hxc3B
	h8qgCfgXO1t/F8n7k9Kh3TXaGVBg1oP3Kg1vX832md4ImbQ2uZgKEnhLH6klmBBBq9e+CXAwLIG
	uhjR7ViNZYoMjxpptPsFDlAnh4+FjwTsDusltX+jGupx7RQJ4k54NlUdPvB7BkpiVUFM65nFBnn
	f3AuSTNpLXWLQv+S7E8fn7AV93eynlKNKiVIPvFbQ7h90CepDhckDSipaRq9l6ROSSt+wZpyQ04
	7LTQ=
X-Received: by 2002:a05:6a21:6016:b0:3cc:9618:f51a with SMTP id adf61e73a8af0-3db0e0ea40amr13919548637.8.1789323910652;
        Sun, 13 Sep 2026 11:25:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:6016:b0:3cc:9618:f51a with SMTP id adf61e73a8af0-3db0e0ea40amr13919502637.8.1789323910173;
        Sun, 13 Sep 2026 11:25:10 -0700 (PDT)
Received: from localhost ([155.117.96.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm23050289eec.3.2026.09.13.11.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 11:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 02:24:58 +0800
Message-Id: <DLEEDV17BW1I.2QLKNNOLNOTGS@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <spacemit@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 00/17] drm/spacemit: add SpacemiT K3 display support
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <codykang.hk@gmail.com>, "David Airlie" <airlied@gmail.com>,
        "Simona
 Vetter" <simona@ffwll.ch>,
        "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,
        "Maxime Ripard" <mripard@kernel.org>,
        "Thomas Zimmermann" <tzimmermann@suse.de>,
        "Rob Herring" <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        "Conor Dooley"
 <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>,
        "Vinod Koul"
 <vkoul@kernel.org>,
        "Neil Armstrong" <neil.armstrong@linaro.org>,
        "Haylen
 Chu" <heylenay@4d2.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
        "Yao Zi" <me@ziyao.cc>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        "Guodong
 Xu" <docular.xu@gmail.com>
X-Mailer: aerc 0.22.0.r10.g73f20125
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
In-Reply-To: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI1OSBTYWx0ZWRfX7FrQxwwPQ5bj
 1xF+s/Bp2io5AUatmmpxF3ZHKCA0QQaH1E69gHsM8Mm/bFN28OSVe3PS2GwvYoZ7y4WoI9zYWbR
 dmQ/CgXpUXAYQIJrd/4HvN8zKb9nkDI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI1OSBTYWx0ZWRfX2+L3DpDRqpHl
 jihxGM8Hsf3EZ7LCLuZ3fO4pfIfw8NFftUCcatg7LbqZGNFy4PEJCzJPhg2gCK0RXg+PBRBkHQp
 pwsVi+BqXqoTwIW0CD71zsQKpvf0CUlhQNOky7N2BwYEwBM7GxTAjSa/otkyx6sHb9G6jJJEBKY
 uRh64wgO9a2IPi6j0dJUGxteivYvBrKS6RSVef4dhMs7MlVxaWSu5cPMhL65IC03ZyVSU++kOuR
 NeLmNV7nP1I8tHBBfJoHR5E3oibuofKTNKjgC5JSbJ2nVmZaaqe8PRXOxj5RDq9hrq016NfHgL2
 UFOxlb5gan8X+6y1NvR53BsDGnLTpwhKBiAFn8EuB0VW9IOzZw6XXbK7tPHfb+bTq9YJoVb69bc
 Xg0SJJcIaqNa1ul5WuEfieLSV5FMTPePzo62Fz9ISNc4vrxgYiC+1yHqklFUN1Wt0VECD+ZIeRG
 vuM8u/il+MiPzW8meoA==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa6ea87 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ilsi1XWDFcrB9FjxRIUvHg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rqWh80hda8-QOrsfWKMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: -Y2WvDEbKZWOW66Uj74bHAKGNGFrTI_W
X-Proofpoint-GUID: -Y2WvDEbKZWOW66Uj74bHAKGNGFrTI_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1011
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130259

On Sun Aug 9, 2026 at 9:14 PM CST, Cody Kang via B4 Relay wrote:
> This series adds display support for the SpacemiT K3 [2], a RISC-V SoC:
> a new DRM driver, a new PHY driver and three new bindings.
>
> The display path is three blocks deep:
>
>   Saturn DPU -> Innosilicon DP/eDP controller -> Innosilicon DP PHY
>
> In v2, two major improvements:
>
> - Module unload is now robust.
> - The bindings now require the controller's output port (port@1).
>
> The rest of the v2 changes please see below, with details in each patch's
> changelog.
>
> Sashiko AI review contributed total review comments: 57 items, which I
> accepted: 14 items.
>
> v2 repeated the full v1 test matrix on both boards, in built-in and
> modular configurations, plus the new module load/unload rounds.
>
> The v1 cover letter follows below, unchanged, to provide some backgroud
> (I can remove them from cover letter in next version):
>
> The Saturn DPU is SpacemiT's own display processing unit. It has a privat=
e
> address translation unit and a command-list composer that replays a batch
> of register writes when a flush is latched. It exposes one CRTC with one
> primary plane. The K3 instantiates two DPUs, one per display path.
>
> The DPU driver arrives as five staged patches to keep each one a
> reasonable size. The driver only becomes buildable with that last patch.
> Bisect safe.
>
> The DP/eDP controller and its PHY are Innosilicon IP, also two instances
> of each. An instance behaves as embedded DisplayPort or as external
> DisplayPort purely according to what its output port is wired to, so the
> bindings do not distinguish them. The PHY's registers are interleaved
> with the controller's inside one MMIO window, which is why it is
> described as a child node and shares the controller's regmap.
>
> The pixel clock is generated by the DP PHY's PLL, and the SoC's APMU
> pixel-clock mux takes that PLL as an input. Rather than let the display
> driver reach into PHY registers, the PHY registers its PLL as a clock
> provider and the APMU mux is parented to it through the clock framework.
> That is what patches 2, 4, 5 and 6 are for, and it is also what keeps the
> APMU and the DP/eDP controller out of a devicetree provider cycle.
>
> As a first posting of the K3 display subsystem, this patchset supports:
> a single primary plane per CRTC, linear RGB scanout (no plane scaling,
> rotation, YUV or writeback). It does not support DSI, DSC or DP audio,
> and link rates are capped at HBR2.
>
> Based on drm-misc-next at commit 5b9af25f2d0b ("accel/ivpu: Remove
> unnecessary min_t()/max_t() usage"), v7.2-rc2 based.
>
> Testing this series needs a SpacemiT u-boot carrying display support
> [1]. SpacemiT expects to add that support into an official u-boot
> release in August 2026.
>
> Tested on two K3 boards:
>
>   - Pico-ITX: an eDP panel and an external DisplayPort monitor.
>   - CoM260-IFX: DisplayPort only, no eDP.
>
> Note: The eDP panel DTS enablement is not part of this series; a separate
>       series will follow showing how eDP can be verified.
>
> What was run on both boards, with modetest from libdrm and with kmscube:
>
>   - modetest -s, looped over 1920x1080, 1280x720 and 3840x2160
>     on DisplayPort and 2560x1600 on eDP
>   - kmscube, on each head and on both at once
>   - hot-plug and sink swap on the DisplayPort connector

Hi Cody,

Tested the series on a K3 Pico-ITX (mainline v7.3-rc2 + these patches,
display drivers built in). On the DisplayPort output:

- modetest -s: 1920x1080 and 1280x720 OK (native 2560x1440 as well);
3840x2160 not tested: my monitor has no such mode.
- kmscube: OK.
- hot-plug: unplug/replug detected, output re-enables fine.

Tested with the stock vendor U-Boot (2022.10); DP works fine with it.

Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>
