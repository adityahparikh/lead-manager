import React from "react";
import Routes from "../routes/Index";
import RoutesWithSubdomain from "../routes/IndexWithSubdomain";

const parsedData = window.location.host.split(".");

export default props => <>{parsedData.length >= 3 ? RoutesWithSubdomain : Routes}</>;