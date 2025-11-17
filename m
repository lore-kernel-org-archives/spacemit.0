Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD80B3375B9
	for <spacemit@lists.linux.dev>; Mon, 17 Nov 2025 14:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763391342; cv=none; b=bOsq3BWf66qr5XFZJXg4zAARXVUiKvw+okjMcHsYeSLzHCjHrGkT2JqJG5td2iCzjxXvhZKpvJnyp+3VgOojcMe2kMxA2CMmMZRMBJMrA/J3krbuDQLS4TGCUsh+Sbc7Op0q6Sqb9v754UVDJPVfegtRnDkxaPUnrDuD5s0Mgqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763391342; c=relaxed/simple;
	bh=ddKQbg+5aeA8Eos2HAPxgAnbpLqgnU3/bB5DYQTsIto=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RV4rIyWZDv5ZWm1lfL4GOm1DFhCH3UyDRFTKdZX3udXu5nQHM2z++45C4qRltVoMEEZrQGby4ddYMhW1OJhc4QYSfwgMhvNLaonhxQT52BUeoex51jA6I0t5aJbAI6e2AOostTL7/2RPVfH7qwbuUJZUeLVj0IDWaf/0pjJQZPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lTOhfrUn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DGmWodeu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTOhfrUn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DGmWodeu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB3a8v3517229
	for <spacemit@lists.linux.dev>; Mon, 17 Nov 2025 14:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	awbwG/k9XyjzMvCh6NANh6uyBFKHQ/YUvVhYaVb6bNY=; b=lTOhfrUnVVdViObc
	dVXIqvdmzxpeVtUkMLX1z9OnGv+edJ5XTbdvLAe2DcgV7rbnHw0BOsnuKQol2q01
	QZcPHjtaQn8EzTqNSO2LQ6ek9A4xnbC604QgAjnOEctwy5r0OM2URZ8APcqr2VCC
	fRhU+xXuIzWe/ux1tU7orrxc2HqY4KwWSHjTwo4raNX/OkNcIy/qs4RbphlZhnx6
	g4xdwJbZ4AvaBrFyrauLgDFcMsL2VsWA0dNk2Ij9aWC4xxKa0aOTihkVCxA40Bb3
	l5RVJEVFdvWmgkwFTqiCO0Jev0xG5WAlddEn2GCmXr8Ckg44ZJObXSO6OejjMeGg
	nPO9gw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2gg8myd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Mon, 17 Nov 2025 14:55:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b9321b9312so11274656b3a.1
        for <spacemit@lists.linux.dev>; Mon, 17 Nov 2025 06:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763391339; x=1763996139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awbwG/k9XyjzMvCh6NANh6uyBFKHQ/YUvVhYaVb6bNY=;
        b=DGmWodeuPf5VnAYLPiflW8HAJcOOUdNfWz/fQ0eYhuCuDnd1OW1Yz4QDzDYYUhhauL
         seUlu1cramJQidDmRn86vxoYP8eO1XxbFvcJW6zjjFY7QyI0uPu0xNqX6ZEs9hDkW0aF
         RTYL1IBFRgnYo1o+bx7bRpN99TEkpAHDo9VFRkUa5LoHaVySic4mqwPezVntyiRSL0gR
         3ScXEp4NMeY6NY+cRPmzMjuF+SRB00nJzSrB9HPzGkSIKmYAXY7HHi0RxU3RoHabvWZL
         ELVFId0+V6SKAhrEWr5XmISK/Lib+86VsWHWsGomNmonFgzqduPXyxyRNw4PXCTVGEba
         NhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391339; x=1763996139;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=awbwG/k9XyjzMvCh6NANh6uyBFKHQ/YUvVhYaVb6bNY=;
        b=gJlWKOV3KItd3Iim/NoCIZ3KBbXbSsXymtet0NXqhiMzomxJXdJBeGzFuGe1q27Ik3
         S/bdlHMMjjyRI8W+X57lHHWiekBLoD2OX4AuUpq9cCCmQGVsPgzpgCIi6vnDAj/Efzjr
         evm5U2uUsb6eXPDcVWSti4Csoe91PxggvM4TvhbrhuftdPVGt6o7sPbZT/YNXxKVQHVD
         BTiTjtlplrxu6o390pz30kHld53sqlfk4Uutq6kXIMxEnVcFdMQHyoa4fd5VzjO7A1DX
         oC7k1qB+aw5tr4SEjfuBbk306eDLgM7jGm2rA1VqBpF/bN0/AxmlYiw3RPuyLO4M/XmY
         +erg==
X-Forwarded-Encrypted: i=1; AJvYcCXDnNO434/1WROg4/o9KWXBmZZvOQc6pWRM7Xkzw7RL2EHYsC8xeE0dwuGdZzSOAUj0PKQTKYo3AA==@lists.linux.dev
X-Gm-Message-State: AOJu0YylweGp/Dr1eU+aMF+iLlriwYNvXbsyqDJN+TB9tavP3YXHFERZ
	NZk3YEFpVgStW7V2ctUxX89tqAc1FuFoGXkE8PoVdhpLTiTiDTZ6qp2jOUpSste41FiXgZlh5PY
	yNI6onJ/v3sd8p10/YD/ar6TxRI4oz+CyIB/mJo7qJTHFYIZVll/bQQZOhCxBqg==
X-Gm-Gg: ASbGncu/K/JTM1hXTu1dZnsGmhI+5ZrNTX2XQCmYZ2ecECx7VD36lKsjNnWPV0yz7DG
	7UMwCtcPHP0KctDn5J2SOW13DATZpREnd1bL67c/2ei7hQSMj97yoMaSjJn5whwn9qv+xisWaIf
	cqZ60BHYqjGuRXD+5bmnuf36s2k0Vj7IDoqIXdKyYWWr+jUzbTZZ0CR23gle1pm3CEqdJWVdakR
	BUORT7cUvwSwAzSk3+HlbXdjCmZLVw12V0WXGeEnUrRlXoi7vXJatFoNVDoQoRaZKN3rNMq4Gsv
	f0H9frhRFaEGAVX2UzOv+qkbBQL5IPEccsDTUoJI1287CZ71HJV0y6qnh8OWEKwP+BWqHNhf
X-Received: by 2002:aa7:9069:0:b0:7b8:349:1b24 with SMTP id d2e1a72fcca58-7ba3bb8c363mr13353834b3a.22.1763391339438;
        Mon, 17 Nov 2025 06:55:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSL5vJ9zpN99/df4BrrN39IGWZXi59cv6hPKEmE1JVTmbqGnrZbM2VZhjhEvINN7S/y/pFWA==
X-Received: by 2002:aa7:9069:0:b0:7b8:349:1b24 with SMTP id d2e1a72fcca58-7ba3bb8c363mr13353786b3a.22.1763391338914;
        Mon, 17 Nov 2025 06:55:38 -0800 (PST)
Received: from [192.168.1.102] ([120.60.57.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aee8afsm13627213b3a.8.2025.11.17.06.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:55:38 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: dlan@gentoo.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, bhelgaas@google.com,
        lpieralisi@kernel.org, kwilczynski@kernel.org,
        Alex Elder <elder@riscstar.com>
Cc: ziyao@disroot.org, aurelien@aurel32.net, johannes@erdfelt.com,
        mayank.rana@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        shradha.t@samsung.com, inochiama@gmail.com, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        p.zabel@pengutronix.de, christian.bruel@foss.st.com,
        thippeswamy.havalige@amd.com, krishna.chundru@oss.qualcomm.com,
        guodong@riscstar.com, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251113214540.2623070-1-elder@riscstar.com>
References: <20251113214540.2623070-1-elder@riscstar.com>
Subject: Re: (subset) [PATCH v6 0/7] Introduce SpacemiT K1 PCIe phy and
 host controller
Message-Id: <176339133088.9268.13766811346004998135.b4-ty@kernel.org>
Date: Mon, 17 Nov 2025 20:25:30 +0530
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: MjoCv3uvcn-63nimqYt3OkZlXhkEf31v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyNyBTYWx0ZWRfX5BtLeajFfCDC
 lPFNsb2mXunTKnY7vFYFdiY8D7n/9MVJpiJyiXAHmxgi8LVen27nJXAcHJHhL8zmfPJh7yvKuPC
 CeU4bG7yr9ti05h+tvNc+HWZMYepaazPEtZlEZ/CK4mrUUXX2pFq8WC6zHd7ZJN633vH52AZBWa
 XfiSzXx4xvhTHBfDSY6kZArURvEEryxulwp9bwax+eL/cCp4DMvTsYSFgPsVxByRzvk0CFGMwdI
 F28KICazhc47QjUHXM4wTo1qqyiwArQyoUm0sDCE6QtkZ4GbXa+CYF+xE0tw2UJayHHW263wcYj
 t/WSfmp0Yy8Y9F3v/VGj7vyYvgzUApNyW3Iwg782Hl6/HMiln20feGNAQGeI8NE1rrc11gTAOds
 QCR8mDFqpYuHvPhSms6peC+WTnSU5g==
X-Authority-Analysis: v=2.4 cv=Cryys34D c=1 sm=1 tr=0 ts=691b376c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=SvArCPxluHhT4bP621h3eQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=TFzoyenawzPvhxzIwaMA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: MjoCv3uvcn-63nimqYt3OkZlXhkEf31v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170127


On Thu, 13 Nov 2025 15:45:32 -0600, Alex Elder wrote:
> This series introduces a PHY driver and a PCIe driver to support PCIe
> on the SpacemiT K1 SoC.  The PCIe implementation is derived from a
> Synopsys DesignWare PCIe IP.  The PHY driver supports one combination
> PCIe/USB PHY as well as two PCIe-only PHYs.  The combo PHY port uses
> one PCIe lane, and the other two ports each have two lanes.  All PCIe
> ports operate at 5 GT/second.
> 
> [...]

Applied, thanks!

[3/7] dt-bindings: pci: spacemit: Introduce PCIe host controller
      commit: a812b09a6b599ea80ec1065a9a635724a235843d
[5/7] PCI: spacemit: Add SpacemiT PCIe host driver
      commit: ff64e078e45faee50cc6ca7900a3520e8ff1c79e

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

