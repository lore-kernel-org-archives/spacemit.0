Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10658388364
	for <spacemit@lists.linux.dev>; Wed,  4 Mar 2026 23:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668622; cv=none; b=bTJMbCoehueGe68+FKo4XQdc4WhySD2DfDu6YQzUnQbSKEKgKi/8B6CiWgFPQrhy1SOQee3UScy4Ixrpct85DUmChSAEEp7reybOUvGTkPr8s+tAgVc5BdFxywXpNwbHP2ITLYRYOgCgmnwGMiahgxQCpcnUjybw6LZnyokkQo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668622; c=relaxed/simple;
	bh=Q0RmGTaWyrNXkoqSRC4NOGoeVMXVms2krIlt4cMtsHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLR6ObABLiDLlR/dNz7aKkiQ4cMZDnqonp1UrJIdmnYd8LVo3+QQNV8xS/V0/AlsMoSQUH9sL4qTS/S3P6UB5F1AwO/HFh0LghcVXIX03JsLhVhRJG9k9/mOHmzZOkhpG+7NBP16+gYHuSTbZMhot0SXyF5NlyP6olG7O3aH47U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3gyhoDK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtF3lp8i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3gyhoDK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtF3lp8i"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624ILagQ1213714
	for <spacemit@lists.linux.dev>; Wed, 4 Mar 2026 23:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=La/zyW1kZlkdjuba28Y6cKUE
	jgLjT1PdHqsncSoONxI=; b=M3gyhoDKsD95tRqPBt6AVRtUJ8xAewA9091Llh/v
	3N7WGAoRQBPzVIJQ+qMMIDlNc/bfennDxIAH2TEssBH789bj2CFI/9WHiWumbLtX
	Ql5cWWDkmHK/HrduZFYdFIBCxQbuZCUwt9VpsjOneOKdaQDvPYtLjUV+u71lyXmG
	dmxjU+qXynuSopTYtoQMCaamDnBl8AhwF8OiwiX39d0m+NMjaFXCFWCfbfdsFV2h
	o+l1R38GMJrzXlm7o2GPUvHPn1156OUgdepeJ2YZzwgJPRbOnHzpNxoiQgsN2xDS
	DJcDnZ8howbsvkbWgknRmV8ZQ+d0VG8z+7CPjjKVm1P8FQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5tdnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Wed, 04 Mar 2026 23:56:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cff1da5so4207908585a.2
        for <spacemit@lists.linux.dev>; Wed, 04 Mar 2026 15:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668618; x=1773273418; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=;
        b=KtF3lp8ikkz+h1ulfcxF+PRBh0JYJzc4c2HSe4pi6+GIvNDfp7o6h7ME5WiayBeNg4
         FYaHwnnnNk4DjzmKENlGTGaYmXWp+P2uBpobHqLh3UFynBUOxuk4KbNu3q9triprQ7wx
         yMUl7L37ZDUp9Muh0yMSksrBcRdI1MdZCiCY61++7Ax7Hukp+r3phcx+Ef3NvbqlmWif
         zzI06yoKbqd6fYpvF19UdfLOt83D9b+nO/YGmh6P9Z+8jC2eNkkLNOElTDgCgf80TtIJ
         1hKcaH8qUtLbVvQMlmacqdta6r+nPpOGf9n4D8rPktjtCYMFqsmceWD87IQquwu3mx1M
         Qmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668618; x=1773273418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=;
        b=Hqpn1S4Ss/S245pyu/iSOCHKKqnbd8DbADwI0Vy5tiF0x9kErFuoaQSnKyfh1mPt6P
         tLxEXZJXtUMsFSOtzDMjuPGpsNFFAINRaidmx+T6JVj9FGquA1Nadev0ZyBf/+X07z19
         JAL5O9Mwq6n0AsN8hXeetLTA7/XYPF/aJf1QGW7RdWhEXyTArd2CNQECvFvGKzvHe5Wb
         bXat4wYK1JqRVMi9Tb1H8zogF48Jm95foynGIP4E1fgWo4c8TLyyaPuj/jvORyxSv82X
         GIPXj+rDfCTfp2uQ1tUvI0Rt3meWnNh9fKVmBBFIpwMZ4IoWS3Lwxk8XJm8sIiBWEm40
         AcCA==
X-Forwarded-Encrypted: i=1; AJvYcCWU5e6iKy8H5bMyRLR1Mnvy3wn5Q4RY878tmbWyxTTRM1LOZk1YKqMduOEPQ8kMqNKuk1FQxxQeyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtJiR2NUx/Uba8jIeeWEyEHnhXxswnBr9dxzctXOoCcF0o60Yl
	eBmXxX6rGyYD1TAVT2GdgVpO1NZLzfxCSMbBu20jtW/9a76JHMe0bMbT/4UqDn03JD8bGATX8tT
	JLNNvhlrl9WUSLPeCk7qeCm8K5VJsJG0Mt31dTc5LlPkSdbCiTXagC7EJpXYkog==
X-Gm-Gg: ATEYQzzPxWyVcDj4q/hFVoXDwjYOwfSxzgSvkYa+bAvreF4AKm0G2/ip5anpeHktyPu
	IMimdWWrFIQ0seHX5MVciOu7yw5FpRFlz6/tu2vdo72Yxj99CQqbo2w0k4zEp38idgRUupLEijn
	e9gpWBbhGOthzQOxzqgquYDzvOE0SjXDB7bGbeYiSoV69CH1k3Kw5RsA3kZsRCr5xc2EvesOHV8
	QdAoqSNvRQE/sd2/QY+JhOVtZERF2jciO6Y93iBzLrJuzujRzjCiIiItU9LshVwKJbgeG79EnWq
	/pHWW8mwjRBSgZ5GaXQetm5F2d40PWRQSvDCU5Ct95syfkmPBn6oxC/Pug6192XT3Krwuj/qY6h
	qg7pSeUNuspRXo290gMLRLmMvJhY4jNzssAUWatc4AmP4XydsMxh15Suqe6xwlj7dwrd4XySo3A
	qLuIc6MuUc2ur0EzHW+/bPM6t9OSyqMqAbcSg=
X-Received: by 2002:a05:620a:44c2:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8cd5af775e5mr481319085a.40.1772668618476;
        Wed, 04 Mar 2026 15:56:58 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8cd5af775e5mr481314985a.40.1772668617932;
        Wed, 04 Mar 2026 15:56:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123573df2sm1571493e87.65.2026.03.04.15.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:56:56 -0800 (PST)
Date: Thu, 5 Mar 2026 01:56:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 21/22] phy: remove temporary provider
 compatibility from consumer header
Message-ID: <o3yvtltydr5hvve2htwgqbp4bfopgu74ft4gnyelmges3hmiaa@wy3brdd5dnek>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-22-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-22-vladimir.oltean@nxp.com>
X-Proofpoint-GUID: t13Wrpj4eqC6TLo46xRQCHvgct4pGQ84
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5OCBTYWx0ZWRfX0iOksuiLgn7/
 8vkhKY3/4GfVLQs48bUr5PiihBEQ7oX2b7mCfzPuSyTcg2+GDDwQkOl9iPRKOSHNNZgMe+st1EL
 TG8HA66i8ibtVy9LzqeXLiybcp//O7vDspxFb6QiGKQ6Y8hu12JzzvlTl7wfnkoXXVTNx90CtbN
 8MhG88iQCQFyS23kQUxOs2aZBdsVyKdHilokEcsRRDoJM7su+/H7wsqOdpsArwmiIRNGYMug654
 Wwbx3/pNjPCQXQA8WYFi/OraRNeqljYE+8oz3Po5IUYAWdA8/P+HAW/v076BpkVWUXjrwLTeAxp
 yPj2VpFgFYQYpLK+Lv8o+55xJrWQ9z4aet8oGjh0djBaPos+6hxjGrzyHpU/nW1Mn3eOYdmtTSF
 UUdsBGmQoY95W99LLh/4IqrneY+GNNbamCU489Nozs3XPPEPOqRzocbiMIETRg6Df63P/zvEzBZ
 3df/oywxynWDyZNDs1g==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a8c6cb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=Ji6k5uvf-STsHdHMmocA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: t13Wrpj4eqC6TLo46xRQCHvgct4pGQ84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040198

On Wed, Mar 04, 2026 at 07:57:34PM +0200, Vladimir Oltean wrote:
> Now that all consumers have been updated to no longer dereference fields
> inside struct phy, we can hide its definition altogether from public view.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  include/linux/phy/phy.h | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
