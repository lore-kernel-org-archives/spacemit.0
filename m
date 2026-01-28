Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329A0327C0F
	for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769593315; cv=none; b=g0+7h5UgetHFwuN0CaB4i05rfXVsKWvnKmMGX7xJ+92n/K47fJg51swO1guwDETAPffulJGvwOFlzqjGVSz0qxC0H4JekMyi5WdEIuVLjekRky/Ro5/jYQI34al66hHYXVCLXePd8MP9PdLTJ+LqJkqk6YpevNC48jKjg1DSSUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769593315; c=relaxed/simple;
	bh=OFVKmxOPOSe4dwXY9+Q/mahXqXR9bxpSOVH3z95Rrkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dtT1huvLHVpbnQ7pyXpL9JQNOW+pxJjT9GKgLeiBaA3qokCwDdfOSaO3E6OCqwcT/E1yXTUWBYV8Q3Ijqa7hT8eCJBPaKMctTdbGFhDJF8nEsmxYjy0oAJsfpU7XLjsWaHXvpHfWtDvs6qeSqct4XzEwh25wQRp/d901HrrQKJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gH+SyO1e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHd7nVBS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gH+SyO1e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHd7nVBS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S929Nu811716
	for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 09:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85LiEtbp+zi+7uf3UPx9/LEQW4aYkFFdpd5AsmHIyDE=; b=gH+SyO1eAPIg1Dys
	TTYgivMQJlYaU5DhyZ3kyCdqalNDxSAgvF7rdN84KxOIekidaPKJPPTZtXBaqNUY
	4TawC+o2SMTZ68uJg28jX6CjFJtrn9PZNk7JfL6VJ8a3k+EYbjum7ibGgkuqVtBz
	vHWkeRE7tNKOOkqdsIYI2QihIEIQoF/msdFfsA4PvwQ7wS4U56QBnapHLvP5YdrR
	B4yCiQO5jOnluox9IQNSpXXw5z1hnrpVWPdbA5XICsPRqDm0zb1jLA0BNDv0fDWP
	0vGmoEywqCUG60E0wECqHYS5NRzMRcu/uxkEfrH1+Hs/+hkt7Z3S4zQ3ygD4qA7P
	HSZTKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbhvrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 09:41:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5e166fb75so1708579485a.0
        for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 01:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769593312; x=1770198112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85LiEtbp+zi+7uf3UPx9/LEQW4aYkFFdpd5AsmHIyDE=;
        b=SHd7nVBSK51EIqyFNMfOa2IfIFotTD9Wu1YAWAviv11b3ychKm664lnOdjLthdpy2d
         FZ4711vJHe9IdebCbkPu8vSab/KhIUhuGixJiD6dcdUjMK4KGPpmLnQwpBjMmXisc9VG
         93L2UDUCN48fOSbnoOrMd0MpLVUp6VIcKyhPr+xhcP81PoHraRUPhbPf2ctg46ylYoqg
         U9y7AlSAXjIaScYMWnzSdns9Ij+CsgB8SN9nCM58NG6ficNd7w7b5LviuyeosUevevw8
         4tQ40qbQ8u2Ndp37AID/BMmYu8W/WT4C1QcHnZB2FBztkFFwKLNpzXyMBpKsHJuVUDY9
         eyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769593312; x=1770198112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=85LiEtbp+zi+7uf3UPx9/LEQW4aYkFFdpd5AsmHIyDE=;
        b=mWGO8OuSfQJJngjrnySUAkc74cnqYU6Wt+2BAcP+23vMgCKFCWGbIToQTBV7jFrllT
         D9fYWsVU1AotU31y4ct8eyk+OT+B6ZYi1Jo9Tc0i9KL1YzHgV3ndopmKMFgGfe5mQtbo
         sDnvFoA3IPuxGjXhORfRl6omRn34Rc33hQkY/H7v5lp3gRqWXaB1qP/CeEcvpyCJwJA5
         oIGcfz+b7yCHo+WP4WWLyIlD56m3bpZvlanRXBYzFQSyYxByiko4MwcTRzy3urYT/PN+
         FxsOmkCkis6fSh+QyTE+5ZDVWgxSgZEhMdn8+I17qdnwwRw9MAYa7FmVVBF3DSUe0NFS
         gWNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhKcoIIqEmzkFylETd85HuIv9WwnAEJSa2pc35ksyr03KYIh2Ja+UWwfep2bJgKvODuM6umeWGsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5qWbUhYkSbePGWkjdYt2LCSFeESTYLycKzsnzPUc8ZhI+nOKu
	3rKP+wJOrRoPg6Ozeeds6OYskcBn+uLbA6R933RKhuqo/KTq5wqfTRZk9h6p3fpFXj3wN6SCbK5
	BG7IrmIzxYmrWwdqUQBwgwvTy4EZX29Wm6KglFZWYpFoDy66tQzRq5tiBJnvgqw==
X-Gm-Gg: AZuq6aI/XJDiVwiFji0nlgQIuor5Q8tjHKNVpEM7BPHSXf8FVqOJeoWEVZcFLPxOKFr
	/tG5YJJFDDr7DsyViPQ0wsawOQcIRT7YG+VAyTa/7FXYj0hx4HmA10IA8KvmFLIL3wGK/zCll8G
	FiWexTDZMc3ttUl5lNQruGixbv7nVT5nft8HUW3+38wkIfUDYgucqUIGfYJxm4aau5YURaxpe3Q
	oFLy3RRxbw9cmeO8q78D3U1lOqKjRNxY5mNbEVRBWTv6XasR8knkLlQY50MXmwh12FuBlw5lmo9
	yhFlVTg7/r2xA5r7EqR290/FVwcN2Xu2Te2tT58vh9UxzOl4x/ejdan03/V7a+nUnoCBpE8WkGv
	TaEpANZipDynYiB5leRthInOUh7REIVuDPjQUJPc=
X-Received: by 2002:a05:620a:2588:b0:8c6:a734:2c00 with SMTP id af79cd13be357-8c70b82272amr555901385a.15.1769593312449;
        Wed, 28 Jan 2026 01:41:52 -0800 (PST)
X-Received: by 2002:a05:620a:2588:b0:8c6:a734:2c00 with SMTP id af79cd13be357-8c70b82272amr555899785a.15.1769593312025;
        Wed, 28 Jan 2026 01:41:52 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6cbc:dfde:e62d:3195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cfc9sm5410095f8f.21.2026.01.28.01.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:41:51 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
        Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: spacemit-k1: Use PDR for pin direction, not SDR/CDR
Date: Wed, 28 Jan 2026 10:41:49 +0100
Message-ID: <176959330536.12707.18374071693115296433.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127-gpio-spacemit-k1-pdr-v1-1-bb868a517dbc@iscas.ac.cn>
References: <20260127-gpio-spacemit-k1-pdr-v1-1-bb868a517dbc@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Xq81WsiRBrcAw_xbQ0Q4XvFL0fZxoutj
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=6979d9e1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gDi01W8oxqZMKvcAlA8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Xq81WsiRBrcAw_xbQ0Q4XvFL0fZxoutj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA3NyBTYWx0ZWRfX/FWslbV1MYAF
 5iBn34wGsOQjdUvkqUsTD6XB/1zxsILsJLyA8e9IS2OprQ6CXU5QuWHwjuJ4lo04bqJ+IHuxY0d
 ITEU0nc+3wJ6wbVUdK7b5KFzJKRHfKLdMdSS59OAwmyij13EW828y/a4Ei3P7S3+AUxwxsC6umP
 ivZrvHVNPFoCM8OY9jb9eRZRfPYRbstf+1HrW1MxuktxX+MDZBhrxXs88gshgOT4srSkRGySicE
 5lcCf5CMIEPFvRhq4OadZOFLguYqkrU/gr++gAdcGtMae4yco1kDBePR0+yKGWPk3mrtYEX/NyR
 nvFFNa2hmnXeMTOFQUioH+k2uMhoUMVGfSPW/2k4gcQRz7B4gPcrl1NnFLsazXr0vqIE+CA7+g0
 yXdZOsndBfCqcn9U3l//oL/uxFhmZq6alR/tJmY3ufPbKoQ547gPccxJm/dCdffgpFOYcZnM1IY
 zgEaLOt5gNDFjph1QKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280077


On Tue, 27 Jan 2026 10:58:49 +0800, Vivian Wang wrote:
> On the SpacemiT GPIO controller, the direction control register PDR is
> readable and writable [1]. Therefore, implement direction control by
> using PDR as dirout, and don't mark it as unreadable.
> 
> The original implementation, using SDR as dirout and CDR as dirin, is
> not actually a supported configuration by gpio-mmio. The hardware
> supports changing the direction of some pins atomically by writing a
> value with the corresponding bits set to SDR (set as output) or to CDR
> (set as input). However, gpio-mmio does not actually handle this.
> 
> [...]

Applied, thanks!

[1/1] gpio: spacemit-k1: Use PDR for pin direction, not SDR/CDR
      https://git.kernel.org/brgl/c/aa7e37fd770bafaaf856ab77735296955b93e377

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
