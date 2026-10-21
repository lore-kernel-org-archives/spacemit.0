Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575883;
	b=h/dRFuXKuQKfGoB5pMdk0UTcR1i4w1OjHgOYfFd91A6No8W8Ksg28xNraaIyyART2NeL
	 p+qUCacQBNekrRl41Nllnq4lI5HRduuMp4O67PTJq1eakYOGRZ5Wwikffn89W4d8sh0yr
	 A9hJeY6KMeBJJvW6j+l/RmCIsRW9PlFMtPeOFD+sxcY3hTHesTMw5H71vCITEa90+7kYm
	 USqicznj+803sD9AqvZ1ZpSZkmIc5vk96tvMLQxJ19JFwnYBA3H7aD0l3mSia1VUEkkPz
	 lQ14fHd9gyRCfjz6XeDohpvKdRhKlKJMikYGOdpACRsti8CMR/LgF2q9ZI9VgTK8a7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZICGnoDUzzWlAQIxspOsX/uJiYZvuNvYB+Jhm0X2C4U=;
	b=llu2MP2oRnZviJ+jYQ5b/JSbnb0/Yy7mrhYo6BW9yFFvdAk/v+SLySPdRqt2lfxBC2Gw
	 GuhMdVkK8VLN7eKkNxRf7GCte/VK0aUjGOyeigLP3sTPGEt+CiHbyC933pMCcU9Zm5Xl9
	 7zCuN9yzBTKnhVs571EYL15040IDOnA34A6wBWszpi3QLfiVdOmsUWzIf4fRKTWM3cJpu
	 XqOTojLTTXOaQ2ZRJe/BORMqjUH1AUlOMKipc9lT/3O389koPPM7euc5YI0Qtg7NolooQ
	 6kIU8XQUz8bIeBhKNYC0UF8xcB5XQej94Hzceu5PNq7b5ZxmyMbjiixW61qS0esUhwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ahXk7078;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dZFbn7jY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5817606A322
	for <spacemit@lists.linux.dev>; Wed, 21 Oct 2026 09:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5817606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ahXk7078;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dZFbn7jY
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j61H793346
	for <spacemit@lists.linux.dev>; Wed, 21 Oct 2026 09:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZICGnoDUzzWlAQIxspOsX/uJiYZvuNvYB+Jhm0X2C4U=; b=ahXk7078Eg6/b5Ya
	BEW6RV60mcxyAc3S+r/XwNQA8a5FhN9ioUdntl5Hh2qEPJaAB6KJuZlvz+rwprEr
	g9xvPfooth56P+Qs5KIVFP2xPsqNgZwEUq5snCTWrGa5e0dF2G6yPPYDAGQItnKg
	81trmTb8mz34C1Dmny8QhvNV3lb85iZ+kxmKXeA2I2S6OZ3yk9DIxFvB+qojIotU
	Z48gmHMqxhI7tsRmT7aDo5PSGmiAvuftosIIImUw7c6r+js6IcXjgqXE20fKdRBV
	4WH7b66ZvGpz36jOQ+09QSNZX1NusCJY5yu+W3FdP3QLkRHhpjiCi4AfJHXpISgh
	DhIygQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabkatr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Wed, 21 Oct 2026 09:44:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso8108085a.1
        for <spacemit@lists.linux.dev>; Wed, 21 Oct 2026 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575881; x=1793180681; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZICGnoDUzzWlAQIxspOsX/uJiYZvuNvYB+Jhm0X2C4U=;
        b=dZFbn7jY/mZMQKRPLDJJSXjh7ZMDl3YM6xdcYX1d7GJEoTTEJbcIuJWIikH7BTHwhU
         oHLGFd5HUPd6dLtT+h+Q3cVFTyJXxRAf7ffQlbdgmLOOGiLDgyrL0hdIIjm3ctkLox+Z
         Pg73axFajVNqZ7ruUhIC3NTkbfLXpEFSkdqt6uTkUi4slc2TbrBEfgX0Pb4wZ74TGS2B
         cF8roNWzZgHVv1F5X8ZYyeBlnq0ISTfyu5c/DR011eWl7djUPxMSK8aEkU+sXoL71zPf
         ZcgcYFSujzpLAne2jK6DlW6D6bL8+riL1V/9MwLHt+STb4TMaqX1RQ18DSxgVkNAxp1J
         nQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575881; x=1793180681;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZICGnoDUzzWlAQIxspOsX/uJiYZvuNvYB+Jhm0X2C4U=;
        b=OpQfgHboIlC+BYEJfeAsybwktxe5CH9on9BJrceXOHWtBYms+P6ukHImUGj8S3KdCs
         SukNyJoHMaZnVmegk0rzDOd292ZApVVz29MYtE90HkwX5y8r4VF8/9SsSfLfJlrLT5Un
         tcHEjvwO20lohFwQlrLmsWhQzvySUzSrhvlW+b9+XPZ6gXlLC0Y0jw/7ZfbyrgCaeh22
         +mUtmhacDtg7ylVSvC0h0WVKc00Vcc8MVbKZQ1TxZ7wKHYPkYSDIRqfsUyMRuwunDPOB
         n4aYik1f5gYUcLCiQi/0mFvnsWTvDYuR4BKNHL6OhOFC9bDuRfUL92lrR9GuhcmDewgD
         nBKw==
X-Forwarded-Encrypted: i=1; AKwUvBz1UoSVU+N1+E39nwRkTbaW2GTcGVCzk53x+JmVNPHq507SDVgRl9PQSt6zwa+CVkjxJrOJZeZk0g==@lists.linux.dev
X-Gm-Message-State: AFq9FYL536JPnWaVA0pjWMztXXQ43ElaagMSaXj1HWhsVrM8b6D1+lSw
	tuI7fIfNQHJYvbbzgJPhnmhDsdRu6onoso2FoLncpHsjw5TpYV2O/GSCl3pGGytWV7dadt8UXtA
	Qi6P0bwL3Ggqvezk5m4GFduHszZkYrm6vKq26v6uwtX1eNnimDOIwAVDXS12kBg==
X-Gm-Gg: AYBFou0mdB0wzfmJGBRZTJ2vUUBjCpdhD+s5hS0YpOzNByBFRT5TXTOA3ecAvvjv+rW
	3vF2xBwpAuQjlLaZxAV42qxMx5v2SIXa9GnxbFILYP2XhnxjgulzWhC6QqoM/1AtaKU8hzQZOvx
	4LLDu4SkhjQ6++53bV9xbRlH6xegcuc86QICei03uf+PJGFxzoskMmoBa2rM2CiH4cf410S6zD7
	hzSrNo9kgxCecADEiKi3olqiLrqdMnx7D42SLUlkKCss8Dik/bFvSgPmQii1wirImuGXUPopJxN
	UkNFRabu0He2HsK2fnqw/uOfN5dbTFKtY0Me/vqZCqZx4oFfJDu7VKwb/ocm2qdJv11fSa6TEDl
	6pBel0mq72Mbjxt7jeaHylw==
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr367396285a.3.1792575880959;
        Wed, 21 Oct 2026 02:44:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr367390585a.3.1792575880494;
        Wed, 21 Oct 2026 02:44:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f7cc2csm59794166b.24.2026.10.21.02.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:44:39 -0700 (PDT)
Message-ID: <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:44:31 +0200
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
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port
 numbering
To: Chen-Yu Tsai <wenst@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai
 <billy_tsai@aspeedtech.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Peter Griffin
 <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        Minda Chen <minda.chen@starfivetech.com>,
        Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Wei Yang <yangwei1@eswincomputing.com>,
        Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
        Hang Cao <caohang@eswincomputing.com>, Li Jun <jun.li@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>,
        Yang Xiwen <forbidden405@foxmail.com>,
        Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stanley Chang <stanley_chang@realtek.com>,
        Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
        imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        Mathias Nyman <mathias.nyman@intel.com>
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
 <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
 <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
 <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org>
 <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOCBTYWx0ZWRfXzHT5mBnXPLuy
 5VXa1Fwu+7zgP6CyNj4qccK02uHSARy50P5UqzGUSWQZLexLr3rnSd359QcdZcnx3eyxF3fP7IE
 b9jXEnXOxc/PxNyhONSBQ0O8OhzPSR4=
X-Proofpoint-ORIG-GUID: zxVg6LpnL9Q6WKCtl6-b9YxcFTThqzw7
X-Proofpoint-GUID: zxVg6LpnL9Q6WKCtl6-b9YxcFTThqzw7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOCBTYWx0ZWRfX1ohT6MsU/Zaw
 Hvsa+iSIbohib/NDeRPaLuk0ukNHhc+VBW6/zNPYdckYyDcBMR+Me2aCxBW0xu+5aLVp9Z5wk51
 AWM1FiKF2ySA6XJt8pC2cdrbNkdHd8lEZpx51wKUxqCBZA2LogcsH64AlitXHO7znPAhzL1/gzB
 Ojj5k9acVUFWAsw9sfUGpWWPi+QgWTmGw7WK0Btx98l0SKj+hhgmrpCdBmFNX7fb5BUWIlhC7S/
 LnfvuMa6AuhVZqPrwBsCCVcWdXm82lwdXR+HLNmYIEMfM7oebPsfrikbxGDCJWZ6Jx2RjNgyLEG
 3NAQV2GhbcJxh1yzr6phkVVetmZIBq845bj73EHb7SLwjDJS5Ikxdzzb0v6aF4vUo3ES2a8H7MC
 xXYpC3fnXsDGXL1HKfatBr0rznHnXcc4PVugs3HToOdXI80btWOwWQwoOSIeerSjDrV3r9cIwtE
 aLzPAXd9RSvROEy1GFQ==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad88989 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=iuaGvn3fa_lUOTDqeYoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210038

On 10/15/26 11:00 AM, Chen-Yu Tsai wrote:
> (Cc-ed Mathias, the xHCI driver maintainer in case I misunderstood xHCI.)
> 
> On Thu, Oct 15, 2026 at 4:44 PM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> On 10/14/26 18:36, Konrad Dybcio wrote:
>>> On 10/14/26 11:44 AM, Neil Armstrong wrote:
>>>> On 10/14/26 11:29, Chen-Yu Tsai wrote:
>>>>> On Wed, Oct 14, 2026 at 5:28 PM Neil Armstrong
>>>>> <neil.armstrong@linaro.org> wrote:

[...]


>> How about the USB4, does it use the USB3.0 port ?
> 
> I'm not familiar with USB4. A quick search says that it can tunnel
> USB 3.x, DP, and PCIe, and it doesn't have its own USB HCI defined.
> 
> So I'm thinking the USB4 controller would be more like a nexus node
> or multiplexing node, or perhaps like a USB C connector. It has input
> ports for all the protocols it can tunnel, connected to their respective
> controllers (XHCI, DP, PCIe). The binding probably would be very messy
> if one controller supported multiple outgoing ports, as each downstream
> port has a 3-to-1 relationship with its respective upstream protocol
> interfaces.

Yeah that is more or less it.

There needs to be a connection between the USB4 router and the native
(USB3 *port*, not hub | PCIe *port*, not RC | DPTX) protocol adapter
where the tunneled packets end up at to create a PM devlink between it
and the USB4 router.

ACPI does that by adding a `usb4-host-interface = &reference_to_router`
property, for DT that's still undecided:

https://github.com/devicetree-org/dt-schema/pull/196

As far as the Qualcomm implementation goes, I was hoping we could
go forward with base1 numbering as the DWC3 is an XHCI controller:

https://lore.kernel.org/linux-usb/20260929-topic-dwc3_tunneling_state-v4-0-63e296346d57@oss.qualcomm.com/

Konrad
