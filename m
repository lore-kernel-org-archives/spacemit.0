Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666D23B7779
	for <spacemit@lists.linux.dev>; Thu, 26 Mar 2026 08:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774514466; cv=none; b=OewAMzMLP6fOVFPZWlf8LylV6K1DmQC3YRGdeACif9Q9gRBGwyqSCxh6FCYwhVGG34KRzgvcfjrrzRkYYeZr+TiCfigt1Ka1JJ7w6IvQLGpHkwxkkxbKlxjcu6iwyGDnNxdtPhIxhRNEfyQwNFQ1DMu1a4rMqkKzY1EQPpxAY00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774514466; c=relaxed/simple;
	bh=BTWdYF64zIa5F0wvNZbYT/vjVTO5AzLcuRatDC/hPHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NyTP7aqSJQ4B9wxiWUMBH3VgWwIVj8IVwoBj76UWomRM/a537UMtTm/BgrTMmBRirtESdn8IUcU+jPNjE2eWC1w2AeTCLQcw4VzdIpw6MJ8SlXmefflc/Krugl8Zcwec4O2Z3WjjXDYRhN0JUchC2XyONWOvYF2wHFkp3IToTmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kwqFVl0v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8/L5uls; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kwqFVl0v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8/L5uls"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6aElH1965129
	for <spacemit@lists.linux.dev>; Thu, 26 Mar 2026 08:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=; b=kwqFVl0va4Ro4+rt
	fFgR1pQCzXvp8Mms5DBXi0Ow2aYvPUaXH6hlIhO16WnSpOV8MwbNlmWjKWe9TKJE
	J5coywcqs7VMaFOehqKnkiVjfyGA84VV0WzF2crMLMozmnJHtB31gFvTLueSbfT2
	oJz/npWpybSJK7bmwLETA+J1htz3aqgcjl5OnJrb18YiV84BH13+p0O7sLaLxWWp
	qjvKUy1ZBqwJmFSvaZsWvbGKJlGUI/ksvGuSF852jMxu8vFHlEnGMIjHl/YKvGZ1
	YDL7/rX9w/6AkkPIYPuiFYRcd6YJpfYxMRNWh6hNffJVdy8pY1E6zmtANkTByNj1
	7zCBdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4pymj097-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Thu, 26 Mar 2026 08:41:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfc1634e43so123232585a.0
        for <spacemit@lists.linux.dev>; Thu, 26 Mar 2026 01:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774514464; x=1775119264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=;
        b=K8/L5ulsNngKhCxEMOP/8JoTeLYrXMSiD1HKLgOPYIHnnTs3s6C6wvsGIDsShdN6Jx
         oRU8eNZZ7yx3h6JUmU3fpkylzwjNZ2J/+B73aQ211lVqOfOCB1uY9PunmUrrF5SPOgTw
         bFgsjcTo1YahUwVFs2y0sS0cTAO9eEjZGKmL+MRPAWPionVmjy3FOrpDEiAlR4N6pWXp
         bkcmGHyYfobdKdEOImDL27Pukm+mSAbRSr6ZsOfBO7J9scTnzdEHH6zwwRYh+i8I985m
         YyshDICtd1OctwCB2c8DBT45QPyuz10ZIm0DbYoKu4keVoF2vXXwqtPq1no6E+owDZfg
         xtdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774514464; x=1775119264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=;
        b=qb8NLIHrquygshHu0LAsVK2RP9xeV920nM+Te2tNNlmmbv7oQlx4O0CjqQc+UkmLDw
         5Tr9bL9WETFPbkCwuKXHLgI5VP3VmrT1SaUYMcDWmAhHUPKZQ8nzel9xGqTrYK044qBZ
         pfcf3XxbaRUV5mrFY8yi5tRtNZK4QOwMBvBpMEMuU9dkvblzSCMNksi6B47j1Kq4cDxf
         ij4DVkDhK8bIKxeJXUHIn03pf5C8E+Yy0z0Eh8oAcpEfo3ALjMsW+GQ0KZRikUEN3V7x
         do+EdmFuecTvPEozjvOQsZD2rpv3CrqDoYP6Zo2zPSfA1gQDP7jQH9Nuvxjub6MGYq4O
         +ong==
X-Forwarded-Encrypted: i=1; AJvYcCWda3OC0jbXoRcEM7WaUSTvvKCAg5WPRk0u9eHs3lAQEWFIsEtrgVYJGBxuWd5Nhg66KaLGc7MnYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzK5r55i/qNQcuX8NGHbfbIqW1Ob/gvPCfdtsOK7DLa8uEGAp+q
	Pjc6zH1ca2UkQdc+UjOfKT29G21IGhenCB9MQEINJtU2r7rp6artdyLtME73YyCB032M/sGwhzV
	gi/a30MKs9PTBmQslCRFwEi2LxVeW572x0ULqmQtZrrJdpEQK6uB0gQFvUwM/EA==
X-Gm-Gg: ATEYQzxopD3VQyvBlha6I16zX5AXaHicXte0GSc1Xhv5Q70e9oFxRsU9IFPnyqb3AJi
	VHQIInJx4+j9EB9zWes3JuusR3kM+oBaoVlDl/hy/lNTjA4IyXqCxljLWrmiIUXlA7bu1FwIoRM
	O330nOfvpxL9jz9HEVw0bGfpF7uht4xDxWSfwKMjB1sOAK9hpMkrZnJzT3EzfZHnulf4Kdf42aa
	24CzU3zzYB9IKIYo5jIGZUIqIdla7rXjTGQQPKWG2+D2d2HbToi/4K2LN7cOB5AL70/yfVgGQwC
	FBJKkBXzw+flFQzonF37HISsT9RCnxm+PgZwFyqAq8xGfneRXCoY3QVIv1ruW7XYg5rmaMNhDEt
	uCjgFobfxza6e91IwSa+lHtUOXGFAHw54SaTuBDejuaWCpvtjrwM=
X-Received: by 2002:ac8:7e92:0:b0:50b:44cc:2a95 with SMTP id d75a77b69052e-50b80e36ab3mr91222361cf.36.1774514463719;
        Thu, 26 Mar 2026 01:41:03 -0700 (PDT)
X-Received: by 2002:ac8:7e92:0:b0:50b:44cc:2a95 with SMTP id d75a77b69052e-50b80e36ab3mr91222121cf.36.1774514463190;
        Thu, 26 Mar 2026 01:41:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:92a5:ac13:cd81:9625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c845b8sm16608955e9.4.2026.03.26.01.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:41:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Yixun Lan <dlan@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] gpio: fix up CONFIG_OF dependencies
Date: Thu, 26 Mar 2026 09:41:00 +0100
Message-ID: <177451445822.5060.11939390617609457696.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325100144.1696731-1-arnd@kernel.org>
References: <20260325100144.1696731-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JE-41CA63PGtfdfdRnA8HnFJixFZdmDD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2MiBTYWx0ZWRfX38RDpHcK1pip
 meMoxCoGLAd8xbc6osmWt+ERHAdC+qEu8mJR4YaaH0cUWv11/mnGHbv6e056aBdVjcCjcaP2+Qh
 L+fl6DlMpZIasLBkBK0EaM6EnR8I+gZnI75q+Nt6iplTgE33RAEGF9HCTMfe2W1kCB/4iMmlW5O
 gdr0U7/Ly3IXd4BOlCzVdW1fM+pIeBGkpVqoNl8xSNA609QaNv8uJHZPj/4d2B1die/hyg5Z4oL
 Ct/S2sQvvqs64db3t1ccSU1YFb4daqFKvd4QypXEN2y6iyhkcVgo1ySTqxSV1cFdqcQvbSw+HFv
 L2xVNHgd0D82370VrCShkqxUJxNn87kmASjFZ71RAzEUiZi/YM+Urrvr9ZJ8m4FoBGPKvC5orYm
 0juUxfAnxQtMrsff9ySny6ehqSvUjToILSmMAgeXz/ymLwEu/sl9QHqn0CebSUfP2tdTnqFpGO5
 IgN0QTeD7NeEPZncJ2Q==
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=69c4f120 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=faeRYzTSnDSNNYB9Nk0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: JE-41CA63PGtfdfdRnA8HnFJixFZdmDD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1011 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260062


On Wed, 25 Mar 2026 11:01:14 +0100, Arnd Bergmann wrote:
> A number of GPIO drivers that used to have a CONFIG_OF_GPIO dependency now fail
> to build on targets without CONFIG_OF:
> 
> WARNING: unmet direct dependencies detected for GPIO_SYSCON
>   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
>   Selected by [y]:
>   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
> 
> [...]

Applied, thanks!

[1/1] gpio: fix up CONFIG_OF dependencies
      https://git.kernel.org/brgl/c/af475c16bc02a08ed6af6ca0c920f98a45611fe6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
