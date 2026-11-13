Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595947;
	b=4NgwOLZDyFgKi2sBpFWtqExtBMYObbJsiaAAzyqyT7cWekCwG6nSfVYbUX+Ji+SQglC8
	 uITJZtkircBioHkOIydCghtLV+LGvorLpB9ovYtbhAvQu2DYPb96HcRrP9QT4/lopLOP0
	 nlbJSMrLM3pZZWX6EU6VpMc+cZKX8PrC7Yh21FBTfAJcEvGY5OHxFvFUHi7NFgQeuU0VB
	 hfnpHRTRLPMGfDni6HenKWSMWHC9B33NvDa+T6HefYqoVIBEf4n3m6UfeHsIPxMXa/0rV
	 mIlxe5xNEyGt3zCjXerYp67BXCM0gKfaBeKMgkvkJ3YWdeXD0xhogi7A7QvayZGQHhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595947;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Po55cXrE16BxqMC3zVUb3WIMlK8AUcbgD7z5RXqz2B8=;
	b=n8ZnLMBPGBkg/q7n3oN39eATJqfXOClVZT9sAkvGGHTAy40ZzhhiWHcghB6tEUU/jT+0
	 mEVZcsVz1jK0i9y5UWUCPJ/jd+rnNXROyTWfvpShg1bm75ML7NqqBvPTvKB7IdevqqE7G
	 o9MyU7xlS2hboZ3e7L+kNF4Cy2nyaiPtzwAmw6vz9h2rp/r+5VkEc/PgqMMf8NVHioo21
	 hUPAemUon+fTgXa1bjAYqyOxWtJwyW0P3OwZvzdSh/g0FK8PdTV+Dz9ziLXgTv0e5hhOa
	 Q3rz0VfiZhK75PHE3aJUOE4enQGPYi5FmMSM9b0NqjJyqRt9fs76BppLDFIi/WJC5Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nNi9CPyh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VFpfDzi6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3D4606A32D
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 18:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F3D4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nNi9CPyh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VFpfDzi6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADGXJ4l2808696
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 18:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Po55cXrE16BxqMC3zVUb3WIMlK8AUcbgD7z
	5RXqz2B8=; b=nNi9CPyhsHyyazKxfw6F45z9vlk6Y4jA7tuFgEKyxQyxsMVXfzo
	fp7+wMC8OSZFsT7SEkPpDFD9r+Fj1VXMsBM2zxeXOv2VepfzMAjL1f273Vj5Ns5w
	L2VTAmYvroUdfE50aqs80CWgW1oAnWjQuTOapeUDW42jO8+FS5pUOgMLgdJObRnu
	Ydr/nI/7boqTAYHJmCLHek53WNUNNuusvUPmsY50FJdY2CwWwZKOx3K6mjkSctOd
	dpYYRxqWcaT+XNISqD6AcWdknfc5h5YLq6LeC/AKM+VrYrDBHps2AsZ8jnH2UqOM
	pfgUgBGa1jcYlVNIsf2D3GjiEgyjLsY41pQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx662rg9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 18:52:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-948d83322f6so244201885a.1
        for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 10:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595945; x=1795200745; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Po55cXrE16BxqMC3zVUb3WIMlK8AUcbgD7z5RXqz2B8=;
        b=VFpfDzi6UlknTjU0KYvtGgQZJRFiHei87sV3KIfaZlx1mWa1zNTS+pWEKd38Ib+z3T
         XiHmkj1iZcX5WlYs7J4MP9i4Nx66wmWHoW+tRB5q1mV2GWueDryk6SHtt5KnMb0kYdfo
         JL2K+JaQRcB6DZkufOa54dUWo27UkJDuSwx0DzvO6+N16OpKgjTI3vFMpNLS0vcjM2er
         EjvQMei9piYddHRI6fOV9p8QpXYr2VhBH6+Xt2bLv1rgbDeG25b4uWzyLhtE2BRsDX9E
         rNoJMN6cUWNH1qJyjDp7Gt0VVn7IHbzMw2afaZxaClG/aKsM4ukhHOQ3nuv+NeKrK5nC
         5pmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595945; x=1795200745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Po55cXrE16BxqMC3zVUb3WIMlK8AUcbgD7z5RXqz2B8=;
        b=dG5S0JhyakQGOyzioiY5kQtb7TyiP07EUVLtrD9gi9Ff5w8vZVUP+DectgscXfISec
         ap/xREGgAkEJYkyfnz2F9PN2X+Uz512fODKrNHRsup1eMtaDqpoWWreRUhCN2V2XgAhA
         g0Z/erbSYCwxIbXOs18XGTr6IafCK9oCzIMGAElk5Izvb4tTDEVUNtXMbpisEWkR5tJk
         ye33sMyPR+gnzuC/CfaarDHC19+wEM8h9r28odlkG0dMIZI7KkSi9Em4NcLB7mz8I1VI
         6ZJjDf9LuieQNYscwI6nM0ksiBNCFx5M8/ege5ZBLHq1zb/AMdgc0wnXNkThOjryt9ZO
         +s0A==
X-Forwarded-Encrypted: i=1; AL+hErHOHC7EAK1FxQoPzaSPySawxRo1OgJxT9ZmkNFM5mLQkrD3qqbJbmk78ArxHpCwrijdNPq601fwQA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9A0qIR7G79smu18oolvC9zZej0+zeVBcSEqIf3yeMVu4T1x5tD
	75hNv3u2N1Omz1X27I6I9uaSds4ZRGKZYeb6JVXHe6cMQ+NmLeKMg7ineIrqmWM30+ivXxOjmSJ
	F5l04DGx05Qc/ubH3wiuj3NDZMLR2o7+n4VwZhFqK+CG4/5vtRJgm/kX3Mqs8sw==
X-Gm-Gg: AYBFou3eKTOKRpZGh3xwaiCCv0YUNRe8G8WIMjNgMaPHep4Iob73x9QFyfwYDpYu1DB
	/YMYgQGg8sBQfCx/YCWMuRp1By8vfqLblBf0g/T6pkFcEiRAUJ0lqK3pgAGX3/rCDmypsO3rsKY
	Vhx9kDNBMqP0z9MXuA2fBrdTZbFTcjtBgChXAsyxcLRgeKyMUmD6vQE4Hf0XR2GAu6wao8bjQHZ
	VrUZKPcwTlRO70OnwZDWKzeDsBhHYPHHELdNYoU9zxfLnTohkadMLd22L5AzrIlOvpa+wt0WKud
	sruXkiJdgBeN0dXbqbPcpIFFmQz15ibrzblvMo84oKdVqMu9HxiAZhd38r0aYcTqwiPVBmiZMRR
	g0QfJMZnsUa7K4At8+Dx+HQQFUYo5RjovjhBLNu9bC50mOMSSxzcKNELxAemxnQ==
X-Received: by 2002:a05:620a:6845:b0:93a:11a4:223c with SMTP id af79cd13be357-9494ba5f250mr568068585a.9.1794595945221;
        Fri, 13 Nov 2026 10:52:25 -0800 (PST)
X-Received: by 2002:a05:620a:6845:b0:93a:11a4:223c with SMTP id af79cd13be357-9494ba5f250mr568065585a.9.1794595944804;
        Fri, 13 Nov 2026 10:52:24 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm7366316f8f.45.2026.11.13.10.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:52:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Conor Dooley <conor.dooley@microchip.com>,
        Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] riscv: dts: microchip: Correct missing space
Date: Fri, 13 Nov 2026 19:52:15 +0100
Message-ID: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JnAoEWfmUCHyEt5xBJBkALlBOEpkhVPyvMi6si/XwBc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91xedNFYif3mvamZgoOwZEhiwp70kx3USlRYe
 epfxvKUHIaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcXgAKCRDBN2bmhouD
 16XaD/4iNP91Vbd1U/v0zXTsKKKPppFD4Yojr2ttV/+VCgvjy56F7/doRdhxru6CqGUnox/adzc
 l4zf1GOa5rMH+SkUe6+KQOwOhgLEASSlWI5biKzt3pc/VSuxEL/RRCirBjASFiPJc8aSIYf1zb5
 CNzvhfzG7q+B578o57SkzG3UomSp1JHNA2Ndf2br9XzPYvu/raH0QWHIVNirgekaIGV2BkE+DGB
 UQd87Kxgk8ix4Ub0FZYQ655dgh09Y+IV7lwIyTc/UFW4YpdXlHAdNFL7dLJsO/UDmA/peYmEK/y
 7DN5YCfylN+xC++Vdh8HCYEAtnQvKqzLDItVg/uf8DTOQZr9NP5ZAWdI6HN/x6S6yatZNvOw+TN
 ad7+yrq5HilDyAzuOQQJVDMXKn6Lh21djfFh+kxlkTMuCm9kF+3f/EF/aAtRGeOsM2CVJx8tgQE
 gxqd5ksxYe8j2qlJKTJjqN6EaYanTXdIbSdm1C6GLuihQ19hOtSs6gfzTYRKJkFLuEtC0A1Gtim
 OTAX1iYhDhaFbZAnkRRnt3Tye8olTdmIavvHVcLcVIZoe7nqzQh21DYVQJybCWVG5obnAzJGeuS
 zlKW6nkI6QulWBfDik34wXQCV9sI7AwYPS8jKEANul/sUqykne9VXHRqTiE/lpWjxwJE39+i5fr hjD/NmwhyeXmi9Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4ExTRGKnNnZj1ef5m8BciY0l-BV1h1cV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX2775gxhqazlk
 u+b+K3k5WCcQZWDvdBt8zu9UCYWldeAt11DuIrang+ib2WgjfVpEfaX12dKy+9gQj2uMaptkgWT
 GLwLRQ6GYeks/PhPROgG1kaTHucyOfMcCuofvdNxEB3QMSILUzYdspO+ft7n/NG+5vm9ZSIudY/
 VMEWfLhIRUHqQk42zLCXPRzAcKjnUbpNYM3sIJAmogvpo1W84mRQZiN2OdFmR0Hdw9z1sioSzGR
 S9JfbJ1a56DgtNPROTXiwtyKnRArob0fwyDFmiCwNPDDkOuH9N8C7oYSb2HLnCbKW9Lr5py1l3w
 LgOQpEAQuS6trqkD4MzmGCSKcfnfTmdGBUEFAVFw9HY0vmM5gtdgH3hjvu4jGHgGmQaogVoKnJ1
 qDNVczD4XsCWe/pbTEeh3CBWvDWnRPjHtJzGOPFNMNdY/89yYDY6wojSRxVQZv3VnotxULvq+sL
 TZ/TiKlf1AXvHQOCkXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXzqMDpXS3sB8p
 d+qYxP5kl0ZJbNpUZCCckVrt0rG3Az3CTi1evQSLFRPNBwQI/Q4eRMXpSayDW2ZrSX2YClW8dHl
 mntnWLdtobtGSktU6QdFA/PD3k+XzvE=
X-Proofpoint-GUID: 4ExTRGKnNnZj1ef5m8BciY0l-BV1h1cV
X-Authority-Analysis: v=2.4 cv=M/nYuCws c=1 sm=1 tr=0 ts=6af75c69 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=d8qWwIobHd16qk65SKQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

Correct minor style issue around white-space - missing space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
index 180fd8891903..2324d567de45 100644
--- a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
+++ b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
@@ -63,14 +63,14 @@ hss: hss-buffer@bfc00000 {
 };
 
 &gpio0 {
-	status ="okay";
+	status = "okay";
 	gpio-line-names =
 		"", "", "", "", "", "", "", "",
 		"", "", "", "", "MIPI_CAM_RESET", "MIPI_CAM_STANDBY";
 };
 
 &gpio1 {
-	status ="okay";
+	status = "okay";
 	gpio-line-names =
 		"", "", "LED1", "LED2", "LED3", "LED4", "LED5", "LED6",
 		"LED7", "LED8", "", "", "", "", "", "",
@@ -81,7 +81,7 @@ &gpio2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mdio1_gpio>, <&spi0_gpio>, <&can0_gpio>, <&pcie_gpio>,
 		    <&qspi_gpio>, <&uart3_gpio>, <&uart4_gpio>, <&can1_gpio>;
-	status ="okay";
+	status = "okay";
 	gpio-line-names =
 		"", "", "", "", "", "", "SWITCH2", "USR_IO12",
 		"DIP1", "DIP2", "", "DIP3", "USR_IO1", "USR_IO2", "USR_IO7", "USR_IO8",
-- 
2.53.0

